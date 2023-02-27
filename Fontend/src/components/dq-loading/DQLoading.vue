<template>
  <div class="dq-loading">
    <div class="cmp-loading" aria-label="loading">
      <svg class="cmp-loading__spinner" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
        <circle :cx="50" :cy="50" :r="8" className="cmp-loading__track"></circle>
        <circle :cx="50" :cy="50" :r="8" className="cmp-loading__tail"></circle>
      </svg>
    </div>
  </div>
</template>

<script>
export default {
  name: "Loading",
  methods: {
    // Loading() {
    //   return (
    //     <div className='cmp-loading' aria-label='loading'>
    //       <svg className='cmp-loading__spinner' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
    //         <circle cx={50} cy={50} r={8} className='cmp-loading__track'></circle>
    //         <circle cx={50} cy={50} r={8} className='cmp-loading__tail'></circle>
    //       </svg>
    //     </div>
    //   );
    // }
  }
}
</script>

<style scoped>
@-webkit-keyframes spinner {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}

@keyframes spinner {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}

@-webkit-keyframes spinnerTail {
  0% {
    stroke-dasharray: 1, 150;
    stroke-dashoffset: 0;
  }

  50% {
    stroke-dasharray: 90, 150;
    stroke-dashoffset: -35;
  }

  100% {
    stroke-dasharray: 90, 150;
    stroke-dashoffset: -124;
  }
}

@keyframes spinnerTail {
  0% {
    stroke-dasharray: 1, 150;
    stroke-dashoffset: 0;
  }

  50% {
    stroke-dasharray: 90, 150;
    stroke-dashoffset: -35;
  }

  100% {
    stroke-dasharray: 90, 150;
    stroke-dashoffset: -124;
  }
}

.cmp-loading {
  display: flex;
  justify-content: center;
}

.cmp-loading__spinner {
  -webkit-animation-name: spinner;
  animation-name: spinner;
  -webkit-animation-timing-function: linear;
  animation-timing-function: linear;
  -webkit-animation-iteration-count: infinite;
  animation-iteration-count: infinite;
  -webkit-animation-duration: 3s;
  animation-duration: 3s;
  background: transparent;
  width: 50%;
  height: 50%;
}

.cmp-loading__track {
  stroke: #b4d6fa;
  stroke-width: 3px;
  fill: none;
}

.cmp-loading__tail {
  stroke: #0f6cbd;
  stroke-width: 3px;
  fill: none;
  transform-origin: 50% 50%;
  transform: rotate(-90deg);
  stroke-linecap: round;
  -webkit-animation-timing-function: cubic-bezier(0.33, 0, 0.67, 1);
  animation-timing-function: cubic-bezier(0.33, 0, 0.67, 1);
  -webkit-animation-iteration-count: infinite;
  animation-iteration-count: infinite;
  -webkit-animation-duration: 1.5s;
  animation-duration: 1.5s;
  -webkit-animation-name: spinnerTail;
  animation-name: spinnerTail;
}</style>