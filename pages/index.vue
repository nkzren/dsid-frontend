<template>
  <div class="content">
    <CThemeProvider>
      <CColorModeProvider>
        <CBox>
          <HeaderCansado/>
          <Inputs/>
          <MyChart class="chart-container" :chartData=chartData :options=options :height=200 />
        </CBox>
      </CColorModeProvider>
    </CThemeProvider>
  </div>
</template>

<script>

export default {
  name: "Home",
  data: () => {
    return {
      chartData: {
        labels: ["test1", "test2", "test3"],
        datasets: [
          {
            data: [0.1, 0.2, 0.3, 0.4, 0.5],
            label: "test",
            borderColor: "#3e95cd",
          }
        ]
      },
      options: {},
    }
  },
  async fetch() {
    const { options, chartdata } = await this.$axios.$get('spark/average');
    this.options = options;
  } 
}
</script>

<style>
.content {
  @apply flex flex-col m-10;
}

.chart-container {
  @apply max-w-4xl;
}

</style>