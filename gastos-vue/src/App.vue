<template>
  <nav-bar-top/>  

  <div class="container-fluid">
    <router-view/>  
  </div>  
  
</template>

<script>
import NavBarTop from '@/components/plantillas/NavBarTop.vue'

export default {
  name: "App",
  components:{NavBarTop}
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;  
  color: #2c3e50;  
}
</style>
