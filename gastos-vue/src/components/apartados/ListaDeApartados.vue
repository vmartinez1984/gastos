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
                    <router-link :to="{ name: 'agregarApartado' }" class="btn btn-info text-white">
                        Agregar nuevo
                    </router-link>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div v-if="estaCargando">
                <div class="text-center">
                    <div class="spinner-border spinner-border-sm text-info" role="status">
                        <span class="visually-hidden">Cargando...</span>
                    </div>
                </div>
            </div>
            <div v-else>
                <div class="row">
                    <div class="col" @click="ordenarAsc('nombre')">Nombre</div>
                    <div class="col" @click="ordenarAsc('tipoDeApartadoNombre')">Tipo</div>
                    <div class="col text-end">Cantidad inicial</div>
                    <div class="col text-end">Cantidad final</div>
                    <div class="col">Fecha incial</div>
                    <div class="col">Fecha final</div>
                    <div class="col" @click="ordenarAsc('diasRestantes')">Dias restantes</div>
                    <div class="col"></div>
                </div>

                <div class="row mt-1" v-for="apartado in apartados" :key="apartado.id">

                    <div class="col">{{ apartado.nombre }}</div>
                    <div class="col">{{ apartado.tipoDeApartado.nombre }}</div>
                    <div class="col text-end">{{ formato.formatearMoneda(apartado.cantidadInicial) }}</div>
                    <div class="col text-end">{{ formato.formatearMoneda(apartado.cantidadFinal) }}</div>
                    <div class="col">{{ apartado.fechaInicial.toString().substring(0, 10) }}</div>
                    <div class="col">{{ apartado.fechaFinal.toString().substring(0, 10) }}</div>
                    <div class="col">{{ apartado.diasRestantes }}</div>
                    <div class="col">
                        <router-link
                            :to="{ name: 'editarApartado', params: { 'id': apartado.id }, query: { 'subcategoriaId': apartado.subcategoriaId } }"
                            class="btn btn-warning text-white">
                            Editar
                        </router-link>
                        <router-link
                            :to="{ name: 'borrarApartado', params: { 'id': apartado.id }, query: { 'subcategoriaId': apartado.subcategoriaId } }"
                            class="btn btn-danger text-white">
                            Borrar
                        </router-link>
                    </div>
                </div>
            </div>

            <hr class="text-danger" />
            <div class="row">
                <div class="col"></div>
                <div class="col text-end">{{ formato.formatearMoneda(total.cantidadInicial) }}</div>
                <div class="col text-end">{{ formato.formatearMoneda(total.cantidadFinal) }}</div>
                <div class="col text-end">{{ formato.formatearMoneda(total.cantidadFinal - total.cantidadInicial) }}</div>
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
var total = ref({})
var estaCargando = ref(false)

const obtenerApartadosPorSubcategoriaIdAsync = async () => {
    estaCargando.value = true
    if (subcategoriaId.value == 0) {
        apartados.value = await servicioApartados.obtenerTodosAsync()
    } else {
        apartados.value = await servicioSubcategorias.obtenerApartadosPorSubcategoriaIdAsync(subcategoriaId.value)
    }
    total.value.cantidadInicial = 0
    total.value.cantidadFinal = 0
    apartados.value.forEach(apartado => {
        total.value.cantidadInicial += apartado.cantidadInicial
        if (apartado.tipoDeApartadoId == 2)
            total.value.cantidadFinal += apartado.cantidadInicial
        else
            total.value.cantidadFinal += apartado.cantidadFinal
        apartado.tipoDeApartadoNombre = apartado.tipoDeApartado.nombre
    })
    //console.log(apartados.value)
    estaCargando.value = false
}

const obtenerSubcategoriasAsync = async () => {
    estaCargando.value = true
    subcategorias.value = await servicioCategorias.obtenerSubcategoriasPorCategoriasIdAsycn(3)
    estaCargando.value = false
}

const ordenarAsc = async (p_key) => {
    //console.log('ordenar', p_key)
    apartados.value = apartados.value.sort(function (a, b) {
        return a[p_key] > b[p_key] ? 1 : -1
    });
}

onMounted(() => {
    //console.log(useRoute().name)
    subcategoriaId.value = useRoute().query.subcategoriaId == undefined ? 0 : useRoute().query.subcategoriaId
    apartadoNombre.value = useRoute().query.subcategoriaNombre
    obtenerApartadosPorSubcategoriaIdAsync()
    obtenerSubcategoriasAsync()
})
</script>