<template>
  <div class="content">
    <HeaderCansado/>
    <MyChart :chartdata=chartdata :options=options />
  </div>
</template>

<script>

export default {
  data: () => {
    return {
      chartdata: [],
      options: {}
    }
  },
  async fetch() {
    const { options } = await this.$axios.$get('spark/average');
    this.options = options;
  } 
}
</script>
