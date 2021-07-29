<template>
  <div class="input-container">
    <div class="input-field">
      <label for="select-metodo">Escolha o método:</label>
      <select id="select-metodo" v-model="calcMethod">
        <option value="">Selecione...</option>
        <option value="average">Média</option>
        <option value="stdev">Desvio Padrão</option>
        <option value="minsq">Quadrados Mínimos</option>
      </select>
    </div>
    <div class="input-group-period">
      <div class="input-field">
        <label for="year-from">De</label>
        <input id="year-from" v-model="yearRange.from" type=number :max=2021 :min=1930 />
      </div>
      <div class="input-field">
        <label for="year-to">Até</label>
        <input id="year-to" v-model="yearRange.to" type=number />
      </div>
    </div>
    <div class="input-field">
      <label for="select">Agrupar Por:</label>
      <select id="select" v-model="groupBy">
        <option value="">Selecione...</option>
        <option value="year">Ano</option>
        <option value="month">Mês</option>
      </select>
    </div>
    <div class="input-field">
      <label for="select">Informação:</label>
      <select id="select" v-model="info">
        <option value="">Selecione...</option>
        <option value="air-temperature">Air Temperature</option>
        <option value="sea-level-pressure">Sea Level Pressure</option>
        <option value="wind-speed">Wind Speed</option>
        <option value="mean-visibility">Mean Visibility</option>
      </select>
    </div>

    <div class="div-button">
      <button @click="buscar"> Buscar </button>
    </div>
  </div>
</template>

<script>
function range(a, b){
  const from = parseInt(a)
  const to = parseInt(b)

  const arr = []
  for(let i=from; i <= to; i ++){

    arr.push(i)
  }
  return arr
}


export default {
  props: [ ],
  data() {
    return {
      yearRange: {
        from: 2021,
        to: 2021,
      },
      calcMethod: "",
      groupBy: "",
      info: "",
    }
  },
  methods: {
    buscar() {
      this.$emit("buttonClicked", {
        yearRange: range(this.yearRange.from, this.yearRange.to),
        calcMethod: this.calcMethod,
        groupBy: this.groupBy,
      })
    },
  }
}
</script>


<style>
.input-container {
  @apply flex md:w-1/2;
}

.input-container > div {
  @apply mx-3;
}

.input-field {
  @apply flex flex-col pr-6;
}

.input-field > select, .input-field > input, .input-field > button {
  @apply border border-gray-200 p-1.5 my-0.5 rounded;
}


.input-group-period {
  @apply flex;
}

.input-group-period > .input-field > input {
  @apply w-16;
}

.div-button {
  @apply flex flex-col justify-end;
}

.div-button > button {
  @apply bg-blue-200 hover:bg-blue-600 text-white font-bold py-1 px-4 rounded h-8 justify-center mb-2;
}

</style>