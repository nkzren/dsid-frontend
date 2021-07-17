<script>
import { Line } from 'vue-chartjs'

export default {
  extends: Line,
  props: ['chartData', 'options'],
  mounted() {
    console.log({ chartdata: this.chartData, options: this.options});
    this.renderChart(this.chartData, this.options)
  },
}
</script>