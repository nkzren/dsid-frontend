<template>
  <div class="content">
    <CThemeProvider>
      <CColorModeProvider>
        <CBox>
          <HeaderCansado/>
          <Inputs @buttonClicked="buscar"/>
          <MyChart class="chart-container" :chartData=chartData :options=options :height=200 />
        </CBox>
      </CColorModeProvider>
    </CThemeProvider>
  </div>
</template>

<script>

const setLabels = (a) => {
  if (a === "Mês"){

  }
}

export default {
  name: "Home",
  data: () => {
    return {
      chartData: {
        labels: [0, 1],
        datasets: [
          {
            data: [1, 2],
            label: "test",
            borderColor: "#3e95cd",
          }
        ]
      },
      options: {},
    }
  },
  
  methods:{
    buscar(inputValues) {
      console.log({inputValues})
      console.log({value: this.chartData.datasets})
    }
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

