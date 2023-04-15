export default {
    formatearMoneda(cantidad) {
        let val = (cantidad / 1).toFixed(2).replace(',', '.')
        return '$ ' + val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ").padStart(9,' ')
    },

    formatearFecha(date) {
        var fechaActual
        var fechaConFormato
        var mes
        var dia

        if (date == undefined || date == null)
            fechaActual = new Date();
        else
            fechaActual = new Date(date)
            mes = fechaActual.getMonth() + 1
        if (mes < 10)
            mes = '0' + mes
        dia = fechaActual.getDate()
        if (dia < 10)
            dia = '0' + dia
        //console.log(dia)
        fechaConFormato = fechaActual.getFullYear() + "-" + mes + '-' + dia

        return fechaConFormato
    }
}