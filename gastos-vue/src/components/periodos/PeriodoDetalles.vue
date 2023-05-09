<template>
    <div class="card">
        <div class="card-header">
            <h3 class="text-primary">Detalles del periodo {{ periodo.nombre }}</h3>
        </div>
        <div class="card-body">
            <div v-if="estaCargando">
                <div class="text-center">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Cargando...</span>
                    </div>
                </div>
            </div>
            <div>
            <h4 class="text-info">Entradas</h4>
            <hr class="text-info" />
            <div class="row mt-1" v-for="subcategoria in entradas" :key="subcategoria.id">
                <div class="col-md-6">
                    <div class="text-start">
                        {{ subcategoria.nombre }}
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="text-end">
                        {{ formatPrice(subcategoria.cantidad) }}
                    </div>
                </div>
                <div class="col-md-2">
                    <div v-if="subcategoria.gasto.cantidad == 0">
                        <div class="d-grid">
                            <router-link
                                :to="{ name: 'agregarGasto', query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id } }"
                                class="btn btn-warning text-white text-end">
                                {{ formatPrice(subcategoria.gasto.cantidad) }}
                            </router-link>
                        </div>
                    </div>
                    <div v-else>
                        <div class="d-grid">
                            <router-link
                                :to="{ name: 'editarGasto', params:{'id':subcategoria.gasto.id }, query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id, 'nombre': subcategoria.gasto.nombre, 'cantidad': subcategoria.gasto.cantidad } }"
                                class="btn btn-primary text-end">
                                {{ formatPrice(subcategoria.gasto.cantidad) }}
                            </router-link>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="text-primary" />
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-2"></div>
                <div class="col-md-2 text-end">{{ formato.formatearMoneda(totalDeEntradas) }}</div>
            </div>

            <h4 class="text-info">Apartados</h4>
            <hr class="text-info" />
            <div>
                <div class="row mt-1 text-secondary" v-for="subcategoria in apartados" :key="subcategoria.id">
                    <div class="col-md-6">
                        <div class="text-start">
                            {{ subcategoria.nombre }}
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="text-end">
                            {{ formatPrice(subcategoria.cantidad) }}
                        </div>
                    </div>
                    <div class="col-md-2">
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
                <hr class="text-primary" />                
                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-2 text-end">Total <br/>{{ formato.formatearMoneda(totalDeApartados.presupuesto) }}</div>
                    <div class="col-md-2 text-end">Asignado <br/>{{ formato.formatearMoneda(totalDeApartados.cantidad) }}</div>
                    <div class="col-md-2 text-end">Resta <br/>{{ formato.formatearMoneda(totalDeApartados.presupuesto - totalDeApartados.cantidad) }}</div>                    
                </div>
                <div class="row text-info">
                    <div class="col-md-6"></div>
                    <div class="col-md-2 text-end">Resta</div>
                    <div class="col-md-2 text-end">{{ formato.formatearMoneda(totalDeEntradas - totalDeApartados.cantidad)}}</div>
                </div>
            </div>

            <h4 class="text-info">Gastos</h4>
            <hr class="text-info" />
            <div>
                <div class="row mt-1" v-for="subcategoria in gastos" :key="subcategoria.id">
                    <div class="col-md-6">
                        <div class="text-start">
                            {{ subcategoria.nombre }}
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="text-end">
                            {{ formatPrice(subcategoria.cantidad) }}
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div v-if="subcategoria.gasto.cantidad == 0">
                            <div class="d-grid">
                                <router-link
                                    :to="{ name: 'agregarGasto', query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id } }"
                                    class="btn btn-warning text-white text-end">
                                    {{ formatPrice(subcategoria.gasto.cantidad) }}
                                </router-link>
                            </div>
                        </div>
                        <div v-else>
                            <div class="d-grid">
                                <router-link
                                    :to="{ name: 'editarGasto', params:{'id':subcategoria.gasto.id}, query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id, 'nombre':subcategoria.gasto.nombre, 'cantidad': subcategoria.gasto.cantidad } }"
                                    class="btn btn-primary text-end">
                                    {{ formatPrice(subcategoria.gasto.cantidad) }}
                                </router-link>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="text-info" />
                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-2 text-end">Total <br/>{{ formato.formatearMoneda(totalDeGastos.presupuesto) }}</div>
                    <div class="col-md-2 text-end">Asignado <br/>{{ formato.formatearMoneda(totalDeGastos.cantidad) }}</div>
                    <div class="col-md-2 text-end">Resta <br/>{{ formato.formatearMoneda(totalDeGastos.presupuesto - totalDeGastos.cantidad) }}</div>
                </div>
                <div class="row text-info">
                    <div class="col-md-6"></div>
                    <div class="col-md-2 text-end">Resta</div>
                    <div class="col-md-2 text-end">{{ formato.formatearMoneda(totalDeEntradas - totalDeApartados.cantidad - totalDeGastos.cantidad) }}</div>
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
import formato from '@/ayudantes/Formato'

var periodo = ref({})
var route = useRoute()
var entradas = ref([])
var apartados = ref([])
var gastos = ref([])
var totalDeEntradas = ref()
var totalDeApartados = ref({
    presupuesto: 0,
    cantidad: 0
})
var totalDeGastos = ref({
    presupuesto: 0,
    cantidad: 0
})
var estaCargando = ref(true)


const obtenerPeriodoAsync = async () => {
    periodo.value = await servicioPeriodo.obtener(route.params.id)
    console.log(periodo.value)
}

const obtenerSubcategoriasAsync = async () => {
    var data

    data = await servicioSubcategorias.obtenerTodoAsync()
    //console.log(data)
    //Entradas
    totalDeEntradas.value = 0
    data.forEach(subcategoria => {
        var gasto

        gasto = periodo.value.listaDeEntradas.find(element => element.subcategoria.id == subcategoria.id)
        if (gasto == undefined) {
            gasto = {
                cantidad: 0, total: 0
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
            totalDeEntradas.value += gasto.cantidad
        }
    })
    //Presupuesto
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
            totalDeApartados.value.cantidad += gasto.cantidad
            totalDeApartados.value.presupuesto += subcategoria.cantidad
        }
    })
    //gastos
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
            totalDeGastos.value.cantidad += gasto.cantidad
            totalDeGastos.value.presupuesto += subcategoria.cantidad
        }
    })
}

const formatPrice = (value) => {
    let val = (value / 1).toFixed(2).replace(',', '.')
    return '$ ' + val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
}

onMounted(async () => {
    estaCargando.value = true
    await obtenerPeriodoAsync()
    await obtenerSubcategoriasAsync()
    estaCargando.value = false
})
</script>