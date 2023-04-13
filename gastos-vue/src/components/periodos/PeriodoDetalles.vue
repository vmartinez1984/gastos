<template>
    <div class="card">
        <div class="card-header">
            <h3 class="text-primary">Detalles del periodo {{ periodo.nombre }}</h3>
        </div>
        <div class="card-body">
            <h4 class="text-info">Entradas</h4>
            <hr class="text-info" />
            <div class="row mt-1" v-for="subcategoria in entradas" :key="subcategoria.id">
                <div class="col">
                    <div class="text-start">
                        {{ subcategoria.nombre }}
                    </div>
                </div>
                <div class="col">
                    <div v-if="subcategoria.gasto.cantidad == 0">
                        <div class="text-end">
                            <router-link
                                :to="{ name: 'formularioDeGasto', query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id } }"
                                class="btn btn-warning text-white">
                                {{ formatPrice(subcategoria.cantidad) }}
                            </router-link>
                        </div>
                    </div>
                    <div v-else>
                        <div class="text-end">
                            <router-link
                                :to="{ name: 'formularioDeGasto', query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id } }"
                                class="btn btn-primary">
                                {{ formatPrice(subcategoria.cantidad) }}
                            </router-link>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="text-end">
                        {{ formatPrice(subcategoria.cantidad) }}
                    </div>
                </div>
            </div>

            <h4 class="text-info">Apartados</h4>
            <hr class="text-info" />
            <div class="row mt-1 text-secondary" v-for="subcategoria in apartados" :key="subcategoria.id">
                <div class="col-md-8">
                    <div class="text-start">
                        {{ subcategoria.nombre }}
                    </div>
                </div>
                <div class="col-md-1">
                    <div class="text-end">
                        {{ formatPrice(subcategoria.cantidad) }}
                    </div>
                </div>
                <div class="col-md-1">
                    <div v-if="subcategoria.gasto.cantidad == 0">
                        <div class="d-grid">
                            <router-link
                                :to="{ name: 'incrementoDeApartados', query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id, 'subcategoriaNombre': subcategoria.nombre } }"
                                class="btn btn-warning text-white text-end">
                                {{ formatPrice(subcategoria.gasto.cantidad) }}
                            </router-link>
                        </div>
                    </div>
                    <div v-else>
                        <div class="d-grid">
                            <router-link
                                :to="{ name: 'incrementoDeApartados', query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id, 'subcategoriaNombre': subcategoria.nombre } }"
                                class="btn btn-primary text-end">
                                {{ formatPrice(subcategoria.gasto.cantidad) }}
                            </router-link>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="d-grid">
                        <router-link
                            :to="{ name: 'listaDeApartados', query: { 'subcategoriaId': subcategoria.id, 'subcategoriaNombre': subcategoria.nombre } }"
                            class="btn btn-info text-white text-end">
                            {{ formatPrice(subcategoria.gasto.total) }}
                        </router-link>
                    </div>
                </div>
                
            </div>


            <h4 class="text-info">Gastos</h4>
            <hr class="text-info" />
            <div class="row mt-1" v-for="subcategoria in gastos" :key="subcategoria.id">
                <div class="col">
                    <div class="text-start">
                        {{ subcategoria.nombre }}
                    </div>
                </div>
                <div class="col">
                    <div v-if="subcategoria.gasto.cantidad == 0">
                        <div class="text-end">
                            <router-link
                                :to="{ name: 'formularioDeGasto', query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id } }"
                                class="btn btn-warning text-white">
                                {{ formatPrice(subcategoria.gasto.cantidad) }}
                            </router-link>
                        </div>
                    </div>
                    <div v-else>
                        <div class="text-end">
                            <router-link
                                :to="{ name: 'formularioDeGasto', query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id } }"
                                class="btn btn-primary">
                                {{ formatPrice(subcategoria.gasto.cantidad) }}
                            </router-link>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="text-end">
                        {{ formatPrice(subcategoria.cantidad) }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import { onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'
import servicioPeriodo from '@/servicios/ServicioPeriodo'
import servicioSubcategorias from '@/servicios/ServicioSubcategorias'

var periodo = ref({})
var route = useRoute()
var entradas = ref([])
var apartados = ref([])
var gastos = ref([])


const obtenerPeriodoAsync = async () => {
    periodo.value = await servicioPeriodo.obtener(route.params.id)
    console.log(periodo.value)
}

const obtenerSubcategoriasAsync = async () => {
    var data

    data = await servicioSubcategorias.obtenerTodoAsync()
    //console.log(data)
    data.forEach(subcategoria => {
        var gasto

        gasto = periodo.value.listaDeEntradas.find(element => element.subcategoria.id == subcategoria.id)
        if (gasto == undefined) {
            gasto = {
                cantidad: 0
            }
        }
        //console.log("gasto->", gasto)       
        if (subcategoria.categoria.id == 1) {
            entradas.value.push({
                id: subcategoria.id,
                nombre: subcategoria.nombre,
                cantidad: subcategoria.cantidad,
                categoria: {
                    id: subcategoria.categoria.id,
                    nombre: subcategoria.categoria.nombre
                },
                gasto: gasto
            })
        }
    })
    data.forEach(subcategoria => {
        var gasto

        gasto = periodo.value.listaDeApartados.find(element => element.subcategoria.id == subcategoria.id)
        if (gasto == undefined) {
            gasto = {
                cantidad: 0, total: 0
            }
        }
        //console.log("gasto->", gasto)       
        if (subcategoria.categoria.id == 3) {
            apartados.value.push({
                id: subcategoria.id,
                nombre: subcategoria.nombre,
                cantidad: subcategoria.cantidad,
                categoria: {
                    id: subcategoria.categoria.id,
                    nombre: subcategoria.categoria.nombre,
                },
                gasto: { cantidad: gasto.cantidad, total: subcategoria.total }
            })
        }
    })
    data.forEach(subcategoria => {
        var gasto

        gasto = periodo.value.listaDeGastos.find(element => element.subcategoria.id == subcategoria.id)
        if (gasto == undefined) {
            gasto = {
                cantidad: 0, total: 0
            }
        }
        //console.log("gasto->", gasto)       
        if (subcategoria.categoria.id == 2) {
            gastos.value.push({
                id: subcategoria.id,
                nombre: subcategoria.nombre,
                cantidad: subcategoria.cantidad,
                categoria: {
                    id: subcategoria.categoria.id,
                    nombre: subcategoria.categoria.nombre,
                },
                gasto: gasto
            })
        }
    })
}

const formatPrice = (value) => {
    let val = (value / 1).toFixed(2).replace(',', '.')
    return '$ ' + val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
}

onMounted(async () => {
    await obtenerPeriodoAsync()
    await obtenerSubcategoriasAsync()
})
</script>