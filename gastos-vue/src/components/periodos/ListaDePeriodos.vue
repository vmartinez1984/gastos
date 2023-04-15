<template>
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col">
                    <h3 class="text-primary">Periodos</h3>
                </div>
                <div class="col">
                    <div class="text-end">
                        <router-link :to="{ name: 'agregarPeriodo' }" class="btn btn-primary">Agregar </router-link>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-body">
            <div v-if="estaCargando">
                <div class="text-center">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Cargando...</span>
                    </div>
                </div>
            </div>
            <div v-else>
                <div class="row mt-1" v-for="periodo in periodos" :key="periodo.id">
                    <div class="col">{{ periodo.nombre }}</div>
                    <div class="col">{{ periodo.fechaInicial.toString().substring(0, 10) }}</div>
                    <div class="col">{{ periodo.fechaFinal.toString().substring(0, 10) }}</div>
                    <div class="col">
                        <router-link class="btn btn-info text-white"
                            :to="{ name: 'periodoDetalles', params: { 'id': periodo.id } }">Detalles</router-link>
                    </div>
                    <div class="col">
                        <router-link class="btn btn-warning text-white"
                            :to="{ name: 'editarPeriodo', params: { 'id': periodo.id } }">Editar</router-link>
                    </div>
                    <div class="col">
                        <router-link class="btn btn-danger text-white"
                            :to="{ name: 'borrarPeriodo', params: { 'id': periodo.id } }">Borrar</router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import servicioPeriodo from '@/servicios/ServicioPeriodo'
import { ref, onMounted } from 'vue';

var periodos = ref({})
var estaCargando = ref(true)

const obtenerPeriodos = async () => {
    try {
        estaCargando.value = true
        periodos.value = await servicioPeriodo.obtenerTodos();
    } catch (error) {
        console.log(error)
    } finally {
        estaCargando.value = false
    }
}

onMounted(() => {
    obtenerPeriodos()
})
</script>