<template>
    <div class="card">
        <div class="card-header">
            <!-- <h3 class="text-primary">{{ route.query.subcategoriaNombre}}</h3> -->
            <h3 class="text-info">Incremento en la cuenta</h3>
        </div>
        <div class="card-body">
            <router-link :to="{name :'agregarApartado', params:{'id': route.query.periodoId}}" class="btn btn-primary">Nuevo apartado</router-link>
                        
            <div v-if="apartados.length > 0">
                <hr class="text-info" />
                <div class="row text-secondary">
                    <div class="col-md-2">Apartado</div>
                    <div class="col-md-2 text-end">Total</div>
                    <div class="col-md-2">Nombre</div>
                    <div class="col-md-6"></div>
                </div>

                <div class="row mt-2" v-for="(apartado, index) in apartados" :key="apartado.id">
                    <div class="col-md-2 col-sm-4">{{ apartado.nombre }}</div>
                    <div class="col-md-2 col-sm-4 text-end">{{ formato.formatearMoneda(apartado.cantidadInicial) }}</div>
                    <div class="col-md-2 col-sm-4">{{ apartado.tipoDeApartado.nombre }}</div>
                    <div class="col-md-6 col-sm-auto">
                        <form @submit.prevent="agregarDetalleAsync(index, apartado.id)">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="label-form">$</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="number" step="0.01" class="form-control" v-model="cantidad[index]"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="label-form">Nota</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" maxlength="255" class="form-control" v-model="nota[index]" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="d-grid">
                                        <button class="btn btn-primary" type="submit">
                                            Agregar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <hr class="text-info" />
                <div class="row text-secondary">
                    <div class="col-2"></div>
                    <div class="col-2 text-end">{{ formato.formatearMoneda(total) }}</div>
                    <div class="col-2"></div>
                    <div class="col-6"></div>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <router-link :to="{name :'periodoDetalles', params:{'id': route.query.periodoId}}">Regresar</router-link>
        </div>
    </div>
</template>
<script setup>
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router'
import servicioSubcategorias from '@/servicios/ServicioSubcategorias'
import servicioDetalleDeApartados from '@/servicios/ServicioDetalleDeApartados';
import formato from '@/ayudantes/Formato'
import router from '@/router';
import Ayudante from '@/ayudantes/Ayudante';

var route = useRoute()
var apartados = ref([])
var cantidad = ref([])
var nota = ref([])
var detalle = ref({})
var total = ref(0)

const agregarDetalleAsync = async (index, apartadoId) => {
    try{
        //console.log(cantidad.value)
        //console.log(nota.value)
        detalle.value = {
            'apartadoId': apartadoId,
            'cantidad': cantidad.value[index],
            'nota': nota.value[index],
            'periodoId': route.query.periodoId,
            'subcategoriaId': route.query.subcategoriaId,
            'guid': Ayudante.uuidv4()
        }
        console.log(detalle.value)
        await servicioDetalleDeApartados.agregarDetalleAsync(detalle.value)
        if(route.query.periodoId != undefined){
            router.push({name: 'periodoDetalles',params:{ 'id': route.query.periodoId} })
        }
    }catch(exeption){
        alert('Valio pepino :(')
        console.log(exeption)
    }
}

const obtenerApartadosAsync = async () => {
    apartados.value = await servicioSubcategorias.obtenerApartadosPorSubcategoriaIdAsync(route.query.subcategoriaId)
    console.log(apartados.value)
}

onMounted(async () => {
    console.log(route.query)    
    await obtenerApartadosAsync()
    total.value = 0
    apartados.value.forEach(apartado => {
        total.value += apartado.cantidadInicial
    })
})
</script>