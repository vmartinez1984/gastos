<template>
    <h1>Periodos</h1>
    <div class="row" v-for="periodo in periodos" :key="periodo.id">
        <div class="col">{{ periodo.nombre }}</div>
        <div class="col">{{ periodo.fechaInicial.toString().substring(0,10) }}</div>
        <div class="col">{{ periodo.fechaFinal.toString().substring(0,10) }}</div>
        <div class="col">            
            <router-link class="btn btn-info text-white" :to="{name:'periodoDetalles', params:{'id': periodo.id}}">Detalles</router-link>
        </div>
    </div>
</template>
<script setup>
import servicioPeriodo from '@/servicios/ServicioPeriodo'
import {ref, onMounted } from 'vue';

var periodos = ref({})

const obtenerPeriodos = async () =>{
    var data
    data = await servicioPeriodo.obtenerTodos();

    periodos.value =data
}

onMounted(()=>{
    obtenerPeriodos()
})
</script>