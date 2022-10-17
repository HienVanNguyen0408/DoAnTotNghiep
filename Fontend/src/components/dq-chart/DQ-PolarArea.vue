<script>
import {  mixins, PolarArea} from 'vue-chartjs'
const { reactiveProp } = mixins;
export default {
  extends: PolarArea,
  mixins:[reactiveProp],
  props: ['chartdata', 'options'],
  mounted () {
    this.renderChart(this.chartdata, this.options)
  }
}
</script>

<style>
</style>