<template>
    <div class="card">
        <div class="card-header">
            <h3>Agregar apartado</h3>
        </div>
        <div class="card-body">
            <div v-if="apartados.length > 0">
                <h3 class="text-info">Agregue el incremento en la cuenta</h3>
                <hr class="text-info" />
                <div class="row text-secondary">
                    <div class="col-2">Apartado</div>
                    <div class="col-2">Total</div>
                    <div class="col-2">Nombre</div>
                    <div class="col-6"></div>
                </div>
                <div class="row" v-for="(apartado, index) in apartados" :key="apartado.id">
                    <div class="col-2">{{ apartado.nombre }}</div>
                    <div class="col-2">{{ apartado.cantidadInicial }}</div>
                    <div class="col-2">{{ apartado.tipoDeApartado.nombre }}</div>
                    <div class="col-6">
                        <form @submit.prevent="agregarDetalleAsync(index, apartado.id)">
                            <div class="row">
                                <div class="col-5">
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="label-form">Cantidad</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="number" step="0.01" class="form-control" v-model="cantidad[index]"
                                                placeholder="$" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-5">
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="label-form">Nota</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" maxlength="255" class="form-control" v-model="nota[index]" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
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
            </div>
            <hr />
            <div>
                <h4 class="text-primary">Agregar nuevo apartado</h4>
                <form @submit.prevent="guardarAsync">
                    <div class="row mt-1">
                        <div class="col-2">
                            <label class="form-label">Subcategoria</label>
                        </div>
                        <div class="col-10">
                            <select class="form-select" v-model="apartado.subcategoriaId">
                                <option value="0">Seleccione</option>
                                <option v-for="subcategoria in subcategorias" :key="subcategoria.id"
                                    :value="subcategoria.id">
                                    {{ subcategoria.nombre }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col-2">
                            <label class="form-label">Tipo de apartado</label>
                        </div>
                        <div class="col-10">
                            <select class="form-select" v-model="apartado.tipoDeApartadoId">
                                <option value="0">Seleccione</option>
                                <option v-for="tipo in tipoDeApartados" :key="tipo.id" :value="tipo.id">
                                    {{ tipo.nombre }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <label class="form-label">Nombre</label>
                        </div>
                        <div class="col-10">
                            <input type="text" v-model="apartado.nombre" class="form-control" placeholder="Vacaciones" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <label class="form-label">Interes</label>
                        </div>
                        <div class="col-10">
                            <input type="number" step="0.01" v-model="apartado.intereses" class="form-control"
                                placeholder="1.00" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <label class="form-label">Cantidad inicial</label>
                        </div>
                        <div class="col-10">
                            <input type="number" step="0.01" v-model="apartado.cantidadInicial" class="form-control"
                                placeholder="300.00" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <label class="form-label">Cantidad final</label>
                        </div>
                        <div class="col-10">
                            <input type="number" step="0.01" v-model="apartado.cantidadFinal" class="form-control"
                                placeholder="301.00" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <label class="form-label">Fecha inicial</label>
                        </div>
                        <div class="col-10">
                            <input type="date" v-model="apartado.fechaInicial" class="form-control" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <label class="form-label">Fecha final</label>
                        </div>
                        <div class="col-10">
                            <input type="date" v-model="apartado.fechaFinal" class="form-control" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <!-- <router-link :to="{ name: 'periodoDetalles', params: { 'id': route.query.periodoId } }">
                            Regresar
                        </router-link> -->
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
    </div>
</template>
<script setup>
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router'
import servicioSubcategorias from '@/servicios/ServicioSubcategorias'
import servicioCategorias from '@/servicios/ServicioCategorias';
import servicioApartados from '@/servicios/ServicioApartados'
import servicioTipoDeApartados from '@/servicios/ServicioTipoDeApartados';
import router from '@/router';

var route = useRoute()
var subcategorias = ref([])
var tipoDeApartados = ref([])
var subcategoria = ref({})
var apartado = ref({
    tipoDeApartadoId: 0,
    nombre: '',
    intereses: 0,
    cantidadInicial: undefined,
    cantidadFinal: undefined,
    fechaInicial: undefined,
    fechaFinal: undefined,
    periodoId: undefined,
    subcategoriaId: 0,
})
var apartados = ref([])
var cantidad = ref([])
var nota = ref([])
var detalle = ref({})

const agregarDetalleAsync = async (index, apartadoId) => {
    //console.log(cantidad.value)
    //console.log(nota.value)
    detalle.value = {
        'apartadoId': apartadoId,
        'cantidad': cantidad.value[index],
        'nota': nota.value[index],
        'periodoId': route.query.periodoId,
        'subcategoriaId': route.query.subcategoriaId
    }

    console.log(detalle.value)
    await servicioApartados.agregarDetalleAsync(detalle.value)
}

const guardarAsync = async () => {
    //console.log(apartado.value)
    try {
        await servicioApartados.agregarAsync(apartado.value)
        router.push({ path: '/apartados' })
    } catch (exeption) {
        console.log(exeption)
    }
}

const uuidv4 = () => {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
        .replace(/[xy]/g, function (c) {
            const r = Math.random() * 16 | 0,
                v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
}

const obtenerSubcategoriasAsync = async () => {
    subcategorias.value = await servicioCategorias.obtenerSubcategoriasPorCategoriasIdAsycn(3)
    subcategorias.value.forEach(item => {
        if (item.id == route.query.subcategoriaId) {
            apartado.value.cantidadInicial = item.cantidad
            apartado.value.nombre = item.nombre
            subcategoria.value = item
        }
    })
}

const obtenerTipoDeApartadosAsync = async () => {
    tipoDeApartados.value = await servicioTipoDeApartados.obtenerTodoAsync()
}

const obtenerApartadosAsync = async () => {
    apartados.value = await servicioSubcategorias.obtenerApartadosPorSubcategoriaIdAsync(route.query.subcategoriaId)
}

onMounted(async () => {
    //console.log(route.query)
    await obtenerSubcategoriasAsync()
    await obtenerTipoDeApartadosAsync()
    apartado.value.periodoId = route.query.periodoId
    apartado.value.subcategoriaId = route.query.subcategoriaId
    apartado.value.idemPotency = uuidv4()
    await obtenerApartadosAsync()
})
</script>