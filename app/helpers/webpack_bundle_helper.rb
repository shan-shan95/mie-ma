# frozen_string_literal: true

require "open-uri"

module WebpackBundleHelper
  class BundleNotFound < StandardError; end

  def javascript_bundle_tag(entry, **options)
    if valid_entry?("#{entry.split("/").last}.js")
      path = asset_bundle_path("#{entry.split("/").last}.js")

      options = {
        src: path,
      }.merge(options)

      # async と defer を両方指定した場合、ふつうは async が優先されるが、
      # defer しか対応してない古いブラウザの挙動を考えるのが面倒なので、両方指定は防いでおく
      options.delete(:defer) if options[:async]
    end

    javascript_include_tag "", **options
  end

  def stylesheet_bundle_tag(entry, **options)
    if valid_entry?("#{entry.split("/").last}.css")
      path = asset_bundle_path("#{entry.split("/").last}.css")

      options = {
        href: path,
      }.merge(options)
    end

    stylesheet_link_tag "", **options
  end

  private

  def asset_server
    Rails.env.development? ? "http://#{request.host}:3035" : "https://d16vmihj9x3vj.cloudfront.net"
  end

  def pro_manifest
    File.read("public/assets/manifest.json")
  end

  def dev_manifest
    OpenURI.open_uri("#{asset_server}/public/assets/manifest.json").read
  end

  def test_manifest
    File.read("public/assets/manifest.json")
  end

  def manifest
    return @manifest ||= JSON.parse(pro_manifest) if Rails.env.production?
    return @manifest ||= JSON.parse(dev_manifest) if Rails.env.development?

    @manifest ||= JSON.parse(test_manifest)
  end

  def valid_entry?(entry)
    return manifest.key?(entry)

    raise BundleNotFound, "Could not find bundle with name #{entry}"
  end

  def asset_bundle_path(entry, **options)
    valid_entry?(entry)
    if Rails.env.development?
      asset_path("#{asset_server}/public/assets" + manifest.fetch(entry), **options)
    else
      asset_path("#{asset_server}/assets" + manifest.fetch(entry), **options)
    end
  end
end
