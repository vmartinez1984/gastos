<template>
    <div class="container">
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-8">
                    <h3 class="text-primary">Subcategorias</h3>
                </div>
                <div class="col-4">
                    <router-link class="btn btn-primary" :to="{ path: '/subcategorias/agregar' }">Nuevo</router-link>
                </div>
            </div>
        </div>
        <div class="card-body">
            <!-- apartados -->
            <div class="row mt-2" v-for="subcategoria in apartados" :key="subcategoria.id">
                <div class="col">{{ subcategoria.categoria.nombre }}</div>
                <div class="col">{{ subcategoria.nombre }}</div>
                <div class="col">
                    <div class="text-end">
                        {{ formatPrice(subcategoria.cantidad) }}</div>
                </div>
                <div class="col text-end">
                    <router-link class="btn btn-warning text-white"
                        :to="{ name: 'editarSubcategoria', params: { 'id': subcategoria.id }, query: { 'categoriaId': subcategoria.categoria.id, 'nombre': subcategoria.nombre, 'cantidad': subcategoria.cantidad, 'guid': subcategoria.guid } }">
                        Editar
                    </router-link>
                    <router-link class="btn btn-danger text-white mx-2"
                        :to="{ name: 'borrarSubcategoria', params: { 'id': subcategoria.id }, query: { 'categoriaId': subcategoria.categoria.id, 'nombre': subcategoria.nombre, 'cantidad': subcategoria.cantidad, 'guid': subcategoria.guid } }">
                        Borrar
                    </router-link>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col"></div>
                <div class="col">Total</div>
                <div class="col">
                    <div class="text-end">
                        {{ formatPrice(totalDeApartados) }}</div>
                    </div>
                <div class="col"></div>
            </div>
            <br />

            <!-- gastos -->
            <div class="row mt-2" v-for="subcategoria in gastos" :key="subcategoria.id">
                <div class="col">{{ subcategoria.categoria.nombre }}</div>
                <div class="col">{{ subcategoria.nombre }}</div>
                <div class="col">
                    <div class="text-end">{{ formatPrice(subcategoria.cantidad) }}</div>
                </div>
                <div class="col text-end">
                    <router-link class="btn btn-warning text-white m-1"
                        :to="{ name: 'editarSubcategoria', params: { 'id': subcategoria.id }, query: { 'categoriaId': subcategoria.categoria.id, 'nombre': subcategoria.nombre, 'cantidad': subcategoria.cantidad, 'guid': subcategoria.guid } }">
                        Editar
                    </router-link>
                    <router-link class="btn btn-danger text-white m-1"
                        :to="{ name: 'borrarSubcategoria', params: { 'id': subcategoria.id }, query: { 'categoriaId': subcategoria.categoria.id, 'nombre': subcategoria.nombre, 'cantidad': subcategoria.cantidad, 'guid': subcategoria.guid } }">
                        Borrar
                    </router-link>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col"></div>
                <div class="col">Total</div>
                <div class="col">
                    <div class="text-end">{{ formatPrice(total) }}</div>
                </div>
                <div class="col"></div>
            </div>
            <hr />
            <hr />
            <div class="row">
                <div class="col"></div>
                <div class="col">Total</div>
                <div class="col">
                    <div class="text-end">
                        {{ formatPrice(total + totalDeApartados) }}</div>
                </div>
            </div>
            <!-- entradas -->
            <br />
            <div class="row" v-for="subcategoria in entradas" :key="subcategoria.id">
                <div class="col">{{ subcategoria.categoria.nombre }}</div>
                <div class="col">{{ subcategoria.nombre }}</div>
                <div class="col">
                    <div class="text-end">
                        {{ formatPrice(subcategoria.cantidad) }}</div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col"></div>
                <div class="col">Total</div>
                <div class="col">
                    <div class="text-end">
                        {{ formatPrice(totalDeEntradas) }}</div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>
<script setup>
import { onMounted, ref } from 'vue';
import servicioSubcategorias from '@/servicios/ServicioSubcategorias'

var subcategorias = ref({})
var gastos = ref([])
var apartados = ref([])
var entradas = ref([])
var total = ref()
var totalDeApartados = ref({})
var totalDeEntradas = ref({})

const obtenerSubcategoriasAsync = async () => {
    subcategorias.value = await servicioSubcategorias.obtenerTodoAsync()
    //console.log(subcategorias.value)
    total.value = 0
    totalDeApartados.value = 0
    totalDeEntradas.value = 0
    subcategorias.value.forEach(item => {
        if (item.categoria.id == 2) {
            gastos.value.push({ id: item.id, nombre: item.nombre, categoria: { nombre: item.categoria.nombre, id: item.categoria.id }, cantidad: item.cantidad, guid: item.guid })
            total.value += item.cantidad
        } else if (item.categoria.id == 3) {
            apartados.value.push({ id: item.id, nombre: item.nombre, categoria: { nombre: item.categoria.nombre, id: item.categoria.id }, cantidad: item.cantidad, guid: item.guid })
            totalDeApartados.value += item.cantidad
        } else if (item.categoria.id == 1) {
            entradas.value.push({ id: item.id, nombre: item.nombre, categoria: { nombre: item.categoria.nombre, id: item.categoria.id }, cantidad: item.cantidad, guid: item.guid })
            totalDeEntradas.value += item.cantidad
        }
    })
    console.log(gastos.value)
}

const formatPrice = (value) => {
    let val = (value / 1).toFixed(2).replace(',', '.')
    return '$ ' + val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
}

onMounted(() => {
    obtenerSubcategoriasAsync()
})
</script>