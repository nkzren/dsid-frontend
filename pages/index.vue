<template>
  <div class="content">
    <CThemeProvider>
      <CColorModeProvider>
        <CBox>
          <HeaderCansado />
          <Inputs @buttonClicked="buscar" />
          <MyChart
            class="chart-container"
            :labels="chartData.labels"
            :datasets="chartData.datasets"
            v-if="renderChart"
            :options="options"
            :height="200"
            :key="key"
          />
        </CBox>
      </CColorModeProvider>
    </CThemeProvider>
  </div>
</template>

<script>
function setData(yearRangReq, data, groupBy){
  if(groupBy == 'year'){
    let i = 1
    let k = 1

    for(i; i<yearRangReq.length; i++){
      const x = yearRangReq[i] - yearRangReq[i-1]
      if(x > 1){
        for(let j=0; j<x-1; j++){
          data.splice(k, 0, null)
          k++
        }
      }
      k++
    }
  }
  else{
    let k = 1
    let i = 1

    for(i; i<yearRangReq.length; i++){
      const ano1 = parseInt(yearRangReq[i-1].split("/")[1])
      const mes1 = parseInt(yearRangReq[i-1].split("/")[0])

      const ano2 = parseInt(yearRangReq[i].split("/")[1])
      const mes2 = parseInt(yearRangReq[i].split("/")[0])
      const x = ((ano2-ano1)*12) + mes2 - mes1

      if(x > 1){
        for(let j=0; j<x-1; j++){
          data.splice(k, 0, null)
          k++
        }
      }
      k++
    }
    
  }
  return data
}


const setLabels = (groupBy, yearRange) => {
  if (groupBy === "year"){
    return yearRange
  } else if (groupBy == "month"){
    return yearRange.flatMap((year) => {
      const arr = []
      for(let i=1; i<=12; i++){
        const y = year.toString().slice(2) // pegando os ultimos dois digitos do ano
        arr.push(`${i}/${y}`)
      }
      return arr
    })
  }
}

export default {
  name: "Home",
  data: () => {
    return {
      chartData: {
        labels: [],
        datasets: [
          {
            data: [],
            label: "",
            borderColor: "#3e95cd",
          }
        ]
      },
      options: {
        responsive: true,
      },
      renderChart: true
    }
  },

  async mounted() {
    await console.log(this.$axios.$get('/inventory'))
  },
  
  methods:{
    buscar(inputValues) {
      console.log({inputValues})
      this.chartData.labels = setLabels(inputValues.groupBy, inputValues.yearRange)
      this.chartData.datasets[0].data = [1,8,3, 5, 7, 12,6]
      this.chartData.datasets[0].label = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
      console.log({labels: this.chartData.labels})

      this.renderChart = false
      this.$nextTick(() => {
        this.renderChart = true
      })
    }
  },

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

