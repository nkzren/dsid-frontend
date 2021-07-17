<template>
<div class="container">
  <div class="content-header">
    <h1 class="title">
      ACH2147 - Desenvolvimento de Sistemas de Informação Distribuídos 
    </h1>
    <h2 class="subtitle">
      Exercício-programa 2: Análise de Dados com Spark
    </h2>
  </div>
  <div class="integrantes-container">
    <h3 class="integrantes-title">Integrantes: </h3>
    <ul class="integrantes-list">
      <li class="integrantes-item"> 11208030 - Felipe Voigtlaender Furquim </li>
      <li class="integrantes-item"> 10723836 - Renan Nakazawa </li>
      <li class="integrantes-item"> 10843552 - Stefany Ramos Ramsdorf Nohama</li>
      <li class="integrantes-item"> 11276617 - Vitor da Silva Cairolli </li>
    </ul>
  </div>
</div>
</template>

<script>
</script>

<style>
  .content-header {
    @apply font-sans;
  }

  .title {
    @apply text-3xl font-semibold;
  }

  .subtitle {
    @apply text-2xl italic;
  }

  .container {
    @apply my-5;
  }

  .integrantes-container {
    @apply flex flex-col my-3 w-3/4;
  }

  .integrantes-title {
    @apply font-sans text-xl;
  }

  .integrantes-list {
    @apply flex flex-wrap ml-3;
  }

  .integrantes-list > li {
    @apply py-1.5 w-1/2;
  }
</style>