<script>
import { Bar, mixins } from 'vue-chartjs'
const { reactiveProp } = mixins;
export default {
  extends: Bar,
  mixins: [reactiveProp],
  props: ['chartdata', 'options'],
  watch: {
    'chartdata.labels'(newV, oldV) {
      this.renderChart(this.chartdata, this.options)
    },
    'chartdata.datasets'(newV, oldV) {
      this.renderChart(this.chartdata, this.options)
    },
  },
  mounted() {
    this.renderChart(this.chartdata, this.options)
  }
}
</script>

<style></style>