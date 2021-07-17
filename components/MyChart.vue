<script>
import { Line } from 'vue-chartjs'

export default {
  extends: Line,
  props: ['chartdata', 'options'],
  mounted() {
    console.log({ chartdata: this.chartdata, options: this.options});
    this.renderChart(this.chartdata, this.options)
  }
}
</script>