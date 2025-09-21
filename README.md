# Examen – Automatización de Pruebas

Este repositorio corresponde al entregable del examen de la asignatura **Automatización de Pruebas**.  
Se implementó un flujo de trabajo con **GitFlow**, un proyecto **Maven** configurado con **JUnit 5**, pruebas unitarias e integración, y un pipeline de CI definido en un `Jenkinsfile` versionado en GitHub.  

---

## I. Flujo de ramas (GitFlow)

Se definió un flujo de ramas con GitFlow, considerando las siguientes ramas principales:

- `main` → rama de producción con versiones estables.  
- `develop` → rama de integración.  
- `feature/test-inicial` → rama de desarrollo de la primera prueba unitaria.  
- `release/1.0` → rama de preparación de la primera versión estable.  
- `hotfix/1.0.1` → rama para corrección aplicada en producción.  
- `feature/ci` → rama creada para incorporar el archivo `Jenkinsfile`.  

**Evidencia**:  
Captura del historial de ramas y commits con `git log --oneline --graph --all --decorate`.  

---

## II. Proyecto Maven con pruebas unitarias e integración

Se configuró un proyecto Maven en la carpeta `ProyectoExamen` con el objetivo de permitir la ejecución de pruebas automatizadas.  

El archivo `pom.xml` incluye:
- Dependencia de **JUnit 5**.  
- Configuración del compilador.  
- Plugin `maven-surefire-plugin` para ejecución de pruebas.  

### Estructura del proyecto
```
ProyectoExamen/
│   pom.xml
│   Jenkinsfile
│
└───src
    ├───main
    │   └───java
    │       └───cl
    │           └───examen
    │               Calculadora.java
    │               ServicioOperacion.java
    └───test
        └───java
            └───cl
                └───examen
                    SumaTest.java
                    ServicioOperacionTest.java
```

### Ejemplo de prueba unitaria
`src/test/java/cl/examen/SumaTest.java`
```java
package cl.examen;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class SumaTest {
    @Test
    void testSuma() {
        int resultado = 2 + 3;
        assertEquals(5, resultado, "La suma debería ser 5");
    }
}
```

### Ejemplo de prueba de integración
`src/test/java/cl/examen/ServicioOperacionTest.java`
```java
package cl.examen;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class ServicioOperacionTest {
    @Test
    void testOperacionCompleta() {
        Calculadora calc = new Calculadora();
        ServicioOperacion servicio = new ServicioOperacion(calc);
        int resultado = servicio.operacionCompleta(5, 3);
        assertEquals(10, resultado, "La operación integrada debería ser 10");
    }
}
```

### Ejecución de pruebas
```powershell
mvn clean package -DskipTests   # Compilación
mvn test                        # Ejecución de pruebas
```

Resultado esperado:
```
[INFO] Tests run: 2, Failures: 0, Errors: 0, Skipped: 0
[INFO] BUILD SUCCESS
```

---

## III. Pipeline de Integración Continua (CI)

Se creó un archivo `Jenkinsfile` versionado en la rama `develop` del repositorio.  
El pipeline está compuesto por dos stages principales:

- **Build**: compila el proyecto con Maven (`mvn -DskipTests package`).  
- **Test**: ejecuta automáticamente las pruebas unitarias e integración (`mvn test`), publica los reportes JUnit y archiva artefactos generados.  

**Evidencias:**
- Captura del commit donde se integra el Jenkinsfile en `develop`.  
- Captura del repositorio GitHub mostrando el archivo `ProyectoExamen/Jenkinsfile`.  
- Capturas de ejecución en consola (`mvn clean package` y `mvn test`) finalizando con **BUILD SUCCESS**.  

---

## IV. Conclusiones

El repositorio cumple con los requisitos del examen:  
1. Flujo de ramas con GitFlow.  
2. Proyecto Maven configurado con JUnit 5.  
3. Implementación de pruebas unitarias e integración.  
4. Pipeline de CI versionado en GitHub mediante un `Jenkinsfile`.  
5. Evidencia de compilación y ejecución exitosa de pruebas automatizadas.  

