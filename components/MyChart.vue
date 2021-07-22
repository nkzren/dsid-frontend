<script>
import { Line } from 'vue-chartjs'

export default {
  extends: Line,

  props: ['labels', 'datasets', 'options'],
  computed: {
    chartData: function() {
      return this.data
    }
  },

  mounted() {
    console.log({ chartdata: this.chartData, options: this.options});
    this.update()
  },

  methods: {
    update(){
      this.renderChart({
        labels: this.labels,
        datasets: this.datasets,
      }, 
      this.options)
      console.log("Tapioca")
    }
  },

  watch: {
    data: function() {
      this._chart.destroy();
      //this.renderChart(this.data, this.options);
      this.update()
    }
  }
}

</script>