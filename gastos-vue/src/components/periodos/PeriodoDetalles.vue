<template>
    <div class="card">
        <div class="card-header">
            <h3>Detalles del periodo</h3>
        </div>
        <div class="card-body">
            <h4 class="text-info">Entradas</h4>
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

            <h4 class="text-info">Apartados</h4>
            <div class="row mt-1" v-for="subcategoria in apartados" :key="subcategoria.id">
                <div class="col">
                    <div class="text-start">
                        {{ subcategoria.nombre }}
                    </div>
                </div>
                <div class="col">
                    <div v-if="subcategoria.gasto.cantidad == 0">
                        <div class="text-end">
                            <router-link
                                :to="{ name: 'formularioDeApartado', query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id } }"
                                class="btn btn-warning text-white">
                                {{ formatPrice(subcategoria.gasto.cantidad) }}
                            </router-link>
                        </div>
                    </div>
                    <div v-else>
                        <div class="text-end">
                            <router-link
                                :to="{ name: 'formularioDeApartado', query: { 'periodoId': periodo.id, 'subcategoriaId': subcategoria.id } }"
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
           
            <h4 class="text-info">Gastos</h4>
            <div class="row mt-1" v-for="subcategoria in subcategorias" :key="subcategoria.id">
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
var subcategorias = ref([])
var entradas = ref([])
var apartados = ref([])

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

        gasto = periodo.value.listaCompleta.find(element => element.subcategoria.id == subcategoria.id)
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
        }else if (subcategoria.categoria.id == 3) {
            apartados.value.push({
                id: subcategoria.id,
                nombre: subcategoria.nombre,
                cantidad: subcategoria.cantidad,
                categoria: {
                    id: subcategoria.categoria.id,
                    nombre: subcategoria.categoria.nombre
                },
                gasto: gasto
            })
        }else{
            subcategorias.value.push({
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
    //console.log(subcategorias.value)
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