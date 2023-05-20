<template>
    <div class="card">
        <div class="card-header">
            <h3 :class="titulo.clase">{{ titulo.texto }}</h3>
        </div>

        <div class="card-body">
            <form @submit.prevent="guardarAsync">
                <div class="row">
                    <div class="col-2">
                        <label class="form-label">Nombre</label>
                    </div>
                    <div class="col-10">
                        <input type="text" v-model="periodo.nombre" class="form-control" placeholder="Enero 10"  :disabled="borrar"/>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-2">
                        <label class="form-label">Fecha inicial</label>
                    </div>
                    <div class="col-10">
                        <input type="date" v-model="periodo.fechaInicial" class="form-control" :disabled="borrar"/>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-2">
                        <label class="form-label">Fecha final</label>
                    </div>
                    <div class="col-10">
                        <input type="date" v-model="periodo.fechaFinal" class="form-control" :disabled="borrar"/>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-2">
                        <router-link :to="{ name: 'listaDePeriodos' }">Regresar</router-link>
                    </div>
                    <div class="col-10">
                        <div v-if="borrar">
                            <button class="btn text-white" :class="titulo.claseDelBoton">
                                Borrar
                            </button>
                        </div>
                        <div v-else>
                            <button class="btn text-white" :class="titulo.claseDelBoton">
                                Guardar
                            </button>
                        </div>
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
import { useRoute } from 'vue-router'
import Formato from '@/ayudantes/Formato';
import Ayudante from '@/ayudantes/Ayudante';

var periodo = ref({
    id: 0,
    nombre: '',
    fechaInicial: '',
    fechaFinal: ''
})
var titulo = ref({
    texto: '',
    clase: '',
    claseDelBoton: ''
})
var borrar = ref(false)
var estaCargando = ref()

const guardarAsync = async () => {
    try {
        //console.log(periodo.value)
        estaCargando.value = true
        if (borrar.value) {
            await servicioPeriodo.borrarAsync(periodo.value.id)
        } else {
            if (periodo.value.id == 0)
                await servicioPeriodo.agregarAsync(periodo.value)
            else
                await servicioPeriodo.actualizarAsync(periodo.value)
        }
        router.push({ name: 'listaDePeriodos' })
    } catch (error) {
        console.log(error)
    } finally {
        estaCargando.value = false
    }
}

const obtenerPerido = async () => {
    periodo.value = await servicioPeriodo.obtener(useRoute().params.id)
    periodo.value.fechaInicial = Formato.formatearFecha(periodo.value.fechaInicial)
    periodo.value.fechaFinal = Formato.formatearFecha(periodo.value.fechaFinal)
    //console.log(periodo.value)
}

onMounted(async () => {
    console.log(useRoute().name)
    switch (useRoute().name) {
        case 'agregarPeriodo':
            titulo.value.texto = "Agregar periodo"
            titulo.value.clase = 'text-info'
            titulo.value.claseDelBoton = 'btn-info'
            periodo.value.fechaInicial = Formato.formatearFecha()
            periodo.value.fechaFinal = Formato.formatearFecha()
            periodo.value.guid = Ayudante.uuidv4();
            break

        case 'editarPeriodo':
            titulo.value.texto = 'Editar periodo'
            titulo.value.clase = 'text-warning'
            titulo.value.claseDelBoton = 'btn-warning'
            obtenerPerido()
            break

        case 'borrarPeriodo':
            titulo.value.texto = 'Borrar periodo'
            titulo.value.clase = 'text-danger'
            titulo.value.claseDelBoton = 'btn-danger'
            obtenerPerido()
            borrar.value = true
            break
    }
})
</script>