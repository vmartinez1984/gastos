<template>
    <div class="card">
        <div class="card-header">
            <h4 class="text-primary">{{ titulo }}</h4>
        </div>
        <div class="card-body">
            <div>
                <form @submit.prevent="guardarAsync">
                    <div class="row mt-1">
                        <div class="col-2">
                            <label class="form-label">Subcategoria</label>
                        </div>
                        <div class="col-10">
                            <select class="form-select" v-model="apartado.subcategoriaId" :disabled="dehabilitarFormulario">
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
                            <select class="form-select" v-model="apartado.tipoDeApartadoId"
                                :disabled="dehabilitarFormulario">
                                <option value="0">Seleccione</option>
                                <option v-for="tipo in tipoDeApartados" :key="tipo.id" :value="tipo.id">
                                    {{ tipo.nombre }}
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col-2">
                            <label class="form-label">Nombre</label>
                        </div>
                        <div class="col-10">
                            <input type="text" v-model="apartado.nombre" class="form-control" placeholder="Vacaciones"
                                :disabled="dehabilitarFormulario" />
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col-2">
                            <label class="form-label">Interes</label>
                        </div>
                        <div class="col-10">
                            <input type="number" step="0.01" v-model="apartado.intereses" class="form-control"
                                placeholder="1.00" :disabled="dehabilitarFormulario" />
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col-2">
                            <label class="form-label">Cantidad inicial</label>
                        </div>
                        <div class="col-10">
                            <input type="number" step="0.01" v-model="apartado.cantidadInicial" class="form-control"
                                placeholder="300.00" :disabled="dehabilitarFormulario" />
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col-2">
                            <label class="form-label">Cantidad final</label>
                        </div>
                        <div class="col-10">
                            <input type="number" step="0.01" v-model="apartado.cantidadFinal" class="form-control"
                                placeholder="301.00" :disabled="dehabilitarFormulario" />
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col-2">
                            <label class="form-label">Fecha inicial</label>
                        </div>
                        <div class="col-10">
                            <input type="date" v-model="apartado.fechaInicial" class="form-control"
                                :disabled="dehabilitarFormulario" />
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col-2">
                            <label class="form-label">Fecha final</label>
                        </div>
                        <div class="col-10">
                            <input type="date" v-model="apartado.fechaFinal" class="form-control"
                                :disabled="dehabilitarFormulario" />
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col-2">
                            <router-link :to="{ name: 'listaDeApartados' }">
                                Regresar
                            </router-link>
                        </div>
                        <div class="col-10">
                            <div v-if="route.name == 'borrarApartado'">
                                <button class="btn btn-danger text-white">
                                    Borrar
                                </button>
                            </div>
                            <div v-else>
                                <button class="btn btn-primary">
                                    Guardar
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>


            <br />
            <div>
                <div v-if="mostrarAgregarDetalles">
                    <h5>Agregar o retirar del apartado</h5>
                    <form @submit.prevent="agregarDetalleAsync()">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="row">
                                    <div class="col-4">
                                        <label class="label-form">$</label>
                                    </div>
                                    <div class="col-8">
                                        <input type="number" step="0.01" class="form-control"
                                            v-model="detalleApartado.cantidad" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="row">
                                    <div class="col-4">
                                        <label class="label-form">Nota</label>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" maxlength="255" class="form-control"
                                            v-model="detalleApartado.nota" />
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
                <br />
                <h4 class="text-info">Lista de detalles</h4>
                <div v-for="detalle in apartado.listaDeDetalles" :key="detalle.id">
                    <div class="row">
                        <div class="col text-end">{{ Formato.formatearMoneda(detalle.cantidad) }}</div>
                        <div class="col">{{ Formato.formatearFecha(detalle.fechaDeRegistro) }}</div>
                        <div class="col">{{ detalle.nota }}</div>
                    </div>
                </div>
                <hr class="text-info" />
                <div class="row">
                    <div class="col text-end">{{ Formato.formatearMoneda(totalDeApartado) }}</div>
                    <div class="col"></div>
                    <div class="col"></div>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router'
import servicioCategorias from '@/servicios/ServicioCategorias';
import servicioApartados from '@/servicios/ServicioApartados'
import servicioTipoDeApartados from '@/servicios/ServicioTipoDeApartados';
import servicioDetalleDeApartados from '@/servicios/ServicioDetalleDeApartados';
import router from '@/router';
import Formato from '@/ayudantes/Formato';

var route = useRoute()
var subcategorias = ref([])
var tipoDeApartados = ref([])
var subcategoria = ref({})
var apartado = ref({
    id: 0,
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
var titulo = ref()
var detalleApartado = ref({})
var mostrarAgregarDetalles = ref(true)
var dehabilitarFormulario = ref(false)
var totalDeApartado = ref(0)

const guardarAsync = async () => {
    //console.log(apartado.value)
    try {
        if (route.name == 'borrarApartado') {
            await servicioApartados.borrarAsync(apartado.value.id)
        } else if (apartado.value.id == 0) {
            await servicioApartados.agregarAsync(apartado.value)
        } else {
            await servicioApartados.actualizarAsycn(apartado.value)
        }
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

const obtenerApartadoAsync = async () => {
    apartado.value = await servicioApartados.obtenerAsync(route.params.id)
    apartado.value.fechaInicial = Formato.formatearFecha(apartado.value.fechaInicial)
    apartado.value.fechaFinal = Formato.formatearFecha(apartado.value.fechaFinal)
    apartado.value.subcategoriaId = apartado.value.subcategoria.id
    apartado.value.tipoDeApartadoId = apartado.value.tipoDeApartado.id
    apartado.value.listaDeDetalles.forEach(item => {
        totalDeApartado.value += item.cantidad
    })
}

const agregarDetalleAsync = async () => {
    var id

    detalleApartado.value.nombre = apartado.value.nombre
    detalleApartado.value.apartadoId = route.params.id
    detalleApartado.value.subcategoriaId = apartado.value.subcategoriaId
    detalleApartado.value.periodoId = detalleApartado.value.periodoId == undefined ? 0 : detalleApartado.value.periodoId
    detalleApartado.value.guid = uuidv4()
    console.log(detalleApartado.value)
    id = await servicioDetalleDeApartados.agregarDetalleAsync(detalleApartado.value)
    apartado.value.listaDeDetalles.push({
        apartadoId: route.params.id,
        cantidad: detalleApartado.value.cantidad,
        fechaDeRegistro: Formato.formatearFecha(),
        id: id,
        nota: detalleApartado.value.nota,
        periodoId: 0,
        subcategoriaId: route.query.subcategoriaId
    })

}

onMounted(async () => {
    //console.log(route.name)
    console.log(route.params)
    await obtenerSubcategoriasAsync()
    await obtenerTipoDeApartadosAsync()
    apartado.value.idemPotency = uuidv4()
    switch (route.name) {
        case 'editarApartado':
            await obtenerApartadoAsync()
            apartado.value.periodoId = route.query.periodoId == undefined? 0 : route.query.periodoId
            apartado.value.subcategoria.id = route.query.subcategoriaId
            console.log(apartado.value)
            titulo.value = "Editar apartado"
            break

        case 'agregarApartado':
            titulo.value = "Agregar nuevo apartado"
            break

        case 'borrarApartado':
            await obtenerApartadoAsync()
            dehabilitarFormulario.value = true
            mostrarAgregarDetalles.value = false
            break
    }
})
</script>