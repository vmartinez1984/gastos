import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'DetalleDeApartados/'

export default {

    /**
     * 
     * @param {detalle} detalle 
     * @returns {id = id}
     */
    async agregarDetalleAsync(detalle) {
        console.log("Agregar", detalle)
        let response

        response = await axios.post(
            url,
            {
                "apartadoIdGuid": detalle.apartadoId + "",
                "cantidad": detalle.cantidad,
                "nota": detalle.nota,
                "periodoIdGuid": detalle.periodoId + "",
                "subcategoriaIdGuid": detalle.subcategoriaId + "",
                "guid": detalle.guid
            }
        )

        return response.data.id
    }
}