<template>
    <div class="card">
        <div class="card-header">
            <h3 class="text-primary">Agregar nuevo</h3>
        </div>

        <div class="card-body">
            <form @submit.prevent="guardarAsync">                
                <div class="row">
                    <div class="col-2">
                        <label class="form-label">Nombre</label>
                    </div>
                    <div class="col-10">
                        <input type="text" v-model="periodo.nombre" class="form-control" placeholder="Enero 10"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <label class="form-label">Fecha inicial</label>
                    </div>
                    <div class="col-10">
                        <input type="date" v-model="periodo.fechaInicial" class="form-control" placeholder="300.00"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <label class="form-label">Fecha final</label>
                    </div>
                    <div class="col-10">
                        <input type="date"  v-model="periodo.fechaFinal" class="form-control" placeholder="300.00"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <router-link :to="{name: 'listaDePeriodos'}">Regresar</router-link>
                    </div>
                    <div class="col-10">
                        <button class="btn btn-primary">
                            Guardar
                        </button>
                    </div>                    
                </div>
            </form>
        </div>
    </div>
</template>
<script setup>
import { onMounted, ref } from 'vue'
import servicioPeriodo from '@/servicios/ServicioPeriodo';
import router from '@/router';

var periodo = ref({
    id: 0,
    nombre: '',
    fechaInicial: '',
    fechaFinal: ''
})

const guardarAsync = async () =>{
    //console.log(periodo.value)    
    servicioPeriodo.agregarAsync(periodo.value)
    router.push({name: 'listaDePeriodos'})
}

const obtenerFecha = () =>{
    var fechaActual
    var fechaConFormato
    var mes
    var dia

    fechaActual = new Date();
    mes = fechaActual.getMonth() + 1
    if(mes < 10)
        mes = '0'+ mes
    dia = fechaActual.getDate()
    if(dia < 10)
        dia = '0' + dia
    //console.log(dia)
    fechaConFormato = fechaActual.getFullYear() + "-" + mes + '-' + dia

    return fechaConFormato
}

onMounted(()=>{
    periodo.value.fechaInicial = obtenerFecha()
    periodo.value.fechaFinal = obtenerFecha()    
})
</script>