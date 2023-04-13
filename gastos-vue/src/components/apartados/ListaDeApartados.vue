<template>
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-8">
                    <select class="form-select text-primary" v-model="subcategoriaId"
                        @change="obtenerApartadosPorSubcategoriaIdAsync">
                        <option value="0">Todos</option>
                        <option v-for="subcategoria in subcategorias" :key="subcategoria.id" :value="subcategoria.id">{{
                            subcategoria.nombre }}</option>
                    </select>
                </div>
                <div class="col-4">
                    <router-link :to="{ name: 'formularioDeApartado' }" class="btn btn-info text-white">
                        Agregar nuevo
                    </router-link>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row mt-1" v-for="apartado in apartados" :key="apartado.id">
                <div class="col">{{ apartado.nombre }}</div>
                <div class="col">{{ formato.formatearMoneda(apartado.cantidadInicial) }}</div>
                <div class="col">{{ apartado.tipoDeApartado.nombre }}</div>
                <div class="col">{{ apartado.fechaInicial.toString().substring(0, 10) }}</div>
                <div class="col">
                    <router-link :to="{ name: 'editarApartado', params: { 'id': apartado.id }, query:{'subcategoriaId': apartado.subcategoriaId} }"
                        class="btn btn-info text-white">
                        Detalles
                    </router-link>
                </div>
            </div>
            <hr class="text-danger" />
            <div class="row">
                <div class="col"></div>
                <div class="col">{{ formato.formatearMoneda(total) }}</div>
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
            </div>
        </div>
    </div>
</template>
<script setup>
import { onMounted, ref } from 'vue';
import servicioSubcategorias from '@/servicios/ServicioSubcategorias'
import servicioCategorias from '@/servicios/ServicioCategorias';
import servicioApartados from '@/servicios/ServicioApartados';
import { useRoute } from 'vue-router'
import formato from '@/ayudantes/Formato'

var apartados = ref([])
var apartadoNombre = ref()
var subcategorias = ref([])
var subcategoriaId = ref()
var total = ref()

const obtenerApartadosPorSubcategoriaIdAsync = async () => {
    if (subcategoriaId.value == 0) {
        apartados.value = await servicioApartados.obtenerTodosAsync()
    } else {
        apartados.value = await servicioSubcategorias.obtenerApartadosPorSubcategoriaIdAsync(subcategoriaId.value)
    }
    total.value = 0
    apartados.value.forEach(apartado => {
        total.value += apartado.cantidadInicial
    })
    //console.log(apartados.value)
}

const obtenerSubcategoriasAsync = async () => {
    subcategorias.value = await servicioCategorias.obtenerSubcategoriasPorCategoriasIdAsycn(3)
}

onMounted(() => {
    console.log(useRoute().name)
    subcategoriaId.value = useRoute().query.subcategoriaId == undefined ? 0 : useRoute().query.subcategoriaId
    apartadoNombre.value = useRoute().query.subcategoriaNombre
    obtenerApartadosPorSubcategoriaIdAsync()
    obtenerSubcategoriasAsync()
})
</script>