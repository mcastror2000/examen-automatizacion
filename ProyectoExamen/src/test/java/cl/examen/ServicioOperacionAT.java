package cl.examen;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

/** Prueba de aceptación: valida un flujo de negocio de punta a punta */
public class ServicioOperacionAT {
    @Test
    void escenarioAceptacion() {
        Calculadora calc = new Calculadora();
        ServicioOperacion svc = new ServicioOperacion(calc);
        // flujo completo: suma(8,3)=11  +  resta(8,3)=5  => 16
        int out = svc.operacionCompleta(8, 3);
        assertEquals(16, out, "El flujo de aceptación debe retornar 16");
    }
}
