<template>
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-8">
                    <h3>Subcategorias</h3>
                </div>
                <div class="col-4">
                    <router-link :to="{ path: '/subcategorias/agregar' }">Nuevo</router-link>
                </div>
            </div>
        </div>
        <div class="card-body">
            <!-- apartados -->
            <div class="row" v-for="subcategoria in apartados" :key="subcategoria.id">
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
                        {{ formatPrice(totalDeApartados) }}</div>
                </div>
            </div>
            <br />
            <!-- gastos -->
            <div class="row" v-for="subcategoria in gastos" :key="subcategoria.id">
                <div class="col">{{ subcategoria.categoria.nombre }}</div>
                <div class="col">{{ subcategoria.nombre }}</div>
                <div class="col">
                    <router-link
                        :to="{ name: 'editarSubcategoria',  params: { 'id': subcategoria.id }, query: { 'categoriaId': subcategoria.categoria.id, 'nombre': subcategoria.nombre, 'cantidad': subcategoria.cantidad } }">
                        Editar
                    </router-link>
                </div>
                <div class="col">
                    <div class="text-end">{{ formatPrice(subcategoria.cantidad) }}</div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col"></div>
                <div class="col">Total</div>
                <div class="col">
                    <div class="text-end">{{ formatPrice(total) }}</div>
                </div>
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
    total.value = 0
    totalDeApartados.value = 0
    totalDeEntradas.value = 0
    subcategorias.value.forEach(item => {
        if (item.categoria.id == 2) {
            gastos.value.push({id: item.id, nombre: item.nombre, categoria: { nombre: item.categoria.nombre, id: item.categoria.id  }, cantidad: item.cantidad })
            total.value += item.cantidad
        } else if (item.categoria.id == 3) {
            apartados.value.push({ id: item.id, nombre: item.nombre, categoria: { nombre: item.categoria.nombre, id: item.categoria.id }, cantidad: item.cantidad })
            totalDeApartados.value += item.cantidad
        } else if (item.categoria.id == 1) {
            entradas.value.push({id: item.id, nombre: item.nombre, categoria: { nombre: item.categoria.nombre, id: item.categoria.id  }, cantidad: item.cantidad })
            totalDeEntradas.value += item.cantidad
        }
    })
    //console.log(subcategorias.value)
}

const formatPrice = (value) => {
    let val = (value / 1).toFixed(2).replace(',', '.')
    return '$ ' + val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
}

onMounted(() => {
    obtenerSubcategoriasAsync()
})
</script>