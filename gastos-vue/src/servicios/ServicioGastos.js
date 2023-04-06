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
                "periodoId": gasto.periodoId,
                "idemPotency": gasto.idemPotency,
                "subcategoriaId": gasto.subcategoriaId,
            }
        )        
        console.log(response)

        return response.data
    },
}