<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <router-link to="/periodos" class="nav-link">Periodos</router-link>
  <router-link to="/subcategorias" class="nav-link">Subcategorias</router-link>

  <div class="container-fluid">
    <router-view/>  
  </div>  
  
</template>

<script>

export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
