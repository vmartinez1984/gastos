import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'gastos/'

export default {   

    async agregarAsync(gasto) {
        var response

        response = await axios.post(
            url,            
            {
                "nombre": gasto.nombre,
                "cantidad": gasto.cantidad,
                "presupuesto": gasto.presupuesto,
                "PeriodoGuidId": gasto.periodoId,
                "idemPotency": gasto.idemPotency,
                "SubcategoriaGuidId": gasto.subcategoriaId,
            }
        )        
        console.log(response)

        return response.data
    },

    async actualizarAsync(gasto){
        var response

        response = await axios.put(
            url + gasto.id,
            {
                "nombre": gasto.nombre,
                "cantidad": gasto.cantidad,
                "presupuesto": gasto.presupuesto,
                "PeriodoGuidId": gasto.periodoId,
                "idemPotency": gasto.idemPotency,
                "SubcategoriaGuidId": gasto.subcategoriaId
            }
        )

        console.log(response)
    }
}