<template lang="pug">
#carousel
  .carousel
    a.control-prev(
      @click="back()"
      :class="{ 'is-nonactive': isFirstImage() }"
    )
      span.pagination-icon <
    transition(:name="transitionName")
      img.image(
        :src="url"
        :key="index"
        v-if="visibleImage === index"
        v-for="(url, index) in item.images_url"
        decoding="async"
      )
    a.control-next(
      @click="next()"
      :class="{ 'is-nonactive': isLastImage() }"
    )
      span.pagination-icon >
  .dots
    .dot(
      v-for="(url, index) in item.images_url"
      :key="index"
      :class="{'is-visible' : visibleImage === index}"
    )
</template>

<script>
export default {
  data() {
    return {
      visibleImage: 0,
      transitionName: 'next-image'
    }
  },
  methods: {
    back() {
      if (this.isFirstImage()) {
        return
      } else {
        this.transitionName = 'prev-image'
        this.visibleImage--
      }
    },
    next() {
      if (this.isLastImage()) {
        return
      } else {
        this.transitionName = 'next-image'
        this.visibleImage++
      }
    },
    isFirstImage() {
      return this.visibleImage === 0
    },
    isLastImage() {
      return this.visibleImage === this.item.images_url.length - 1
    }
  },
  props: {
    item: {
      type: Object,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
.carousel {
  max-height: 300px;
  width: 60%;
  overflow: hidden;
  position: relative;
  background-color: lightgray;
  margin: 0 auto;

  .image {
    margin: 0 auto;
    height: 300px;
  }

  .control-prev {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 15%;
    color: white;
    z-index: 2;
  }

  .control-next {
    position: absolute;
    top: 0;
    bottom: 0;
    right: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 15%;
    color: white;
    z-index: 2;
  }

  .is-nonactive {
    opacity: 0.3;
  }

  .pagination-icon {
    font-size: 2.5rem;
    font-weight: 600;
    -webkit-text-stroke: 1px black;
  }
}
.dots {
  height: 50px;
  width: 20%;
  display: flex;
  justify-content: space-around;
  align-items: center;
  align-items: center;
  margin: 0 auto;

  .dot {
    background-color: #d1d1d1;
    border-radius: 50%;
    height: 8px;
    width: 8px;
  }

  .is-visible {
    background-color: #7490fd;
  }
}
.next-image-enter-active,
.next-image-leave-active,
.prev-image-enter-active,
.prev-image-leave-active {
  transition: all 0.4s ease;
}
.next-image-enter,
.prev-image-leave-to {
  transform: translateX(100%);
}
.next-image-leave-to,
.prev-image-enter {
  transform: translateX(-100%);
}
</style>
