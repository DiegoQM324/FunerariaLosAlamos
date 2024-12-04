<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boleta Electrónica</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .boleta {
            max-width: 800px;
            margin: auto;
            background: white;
            border: 1px solid #ddd;
            padding: 20px;
            font-size: 14px;
        }

        .boleta-header {
            display: flex;
            justify-content: flex-start; /* Alinea los elementos a la izquierda */
            align-items: center;
        }

        .qr-code {
            width: 100px;
            height: 100px;
            border: 1px solid #ddd;
        }
    </style>
</head>

<body class="bg-gray-100 p-8 flex justify-center items-center min-h-screen">
    <div class="boleta shadow-md w-full max-w-3xl">
        <!-- Header -->
        <div class="boleta-header">
            <!-- Logo alineado a la izquierda -->
            <div class="mr-0"> 
                <img src="<%= request.getAttribute("logoUrl") != null ? request.getAttribute("logoUrl") : "../img/SA.png" %>" alt="Logo" class="w-24 h-24">
            </div>

            <div class="text-center flex-grow">
                <h1 class="font-bold text-xl">Funeraria Los Alamos</h1>
                <p>Direccion: Domingo Cueto 369 Int.102 Espalda del Hospital Rebaliategui - Lince</p>
                <p>Teléfono(s): (511)115-8000</p>
                <p>Página Web: <a href="https://funerarialosalamos.com/" class="text-blue-500 underline">www.funerarialosalamos.com</a></p>
                <p>Cod. Establec.: 001</p>
            </div>
        </div>

        <!-- Cliente Info -->
        <div class="mt-6">
            <table class="w-full">
                <tr>
                    <td><strong>Cliente:</strong> <%= request.getAttribute("cliente") != null ? request.getAttribute("cliente") : "Hector De La Cruz" %></td>
                    <td><strong>DNI:</strong> <%= request.getAttribute("dni") != null ? request.getAttribute("dni") : "92006254" %></td>
                </tr>
                <tr>
                    <td><strong>Dirección:</strong> <%= request.getAttribute("direccion") != null ? request.getAttribute("direccion") : "Av. Morales Duarez 168" %></td>
                    <td><strong>Fecha de Emisión:</strong> <%= request.getAttribute("fechaEmision") != null ? request.getAttribute("fechaEmision") : "04-12-2024" %></td>
                </tr>
            </table>
        </div>

        <!-- Detalles de la Boleta -->
        <div class="mt-6">
            <table class="w-full border-collapse border border-gray-300 text-sm">
                <thead>
                    <tr class="bg-gray-100">
                        <th class="border px-2 py-1">N.S</th>               
                        <th class="border px-2 py-1">Plan-Servicio</th>
                        <th class="border px-2 py-1">Servicio</th>
                        <th class="border px-2 py-1">Cantidad</th>
                        <th class="border px-2 py-1">Precio Unitario</th>
                        <th class="border px-2 py-1">Valor Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="border px-2 py-1">1</td>
                        <td class="border px-2 py-1">Premiun</td>
                        <td class="border px-2 py-1">Cremacion</td>
                        <td class="border px-2 py-1">1</td>
                        <td class="border px-2 py-1">$300.00</td>
                        <td class="border px-2 py-1">$300.00</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td class="border px-2 py-1"></td>
                        <td class="border px-2 py-1"></td>
                        <td class="border px-2 py-1"></td>
                        <td class="border px-2 py-1"></td>
                        <td class="border px-2 py-1"></td>
                        <td class="border px-2 py-1"></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Totales -->
        <div class="mt-6 text-right">
            <table class="w-full text-sm">
                <tr>
                    <td class="text-right"><strong>Total Descuento Global:</strong></td>
                    <td class="text-right">$0.00</td>
                </tr>
                <tr>
                    <td class="text-right"><strong>Total Valor de Venta - Gravadas:</strong></td>
                    <td class="text-right">$300.00</td>
                </tr>
                <tr>
                    <td class="text-right"><strong>IGV (18.00%):</strong></td>
                    <td class="text-right">$60.00</td>
                </tr>
                <tr>
                    <td class="text-right"><strong>Otros Cargos:</strong></td>
                    <td class="text-right">$ 0.00</td>
                </tr>
                <tr class="bg-gray-100">
                    <td class="text-right text-lg font-bold"><strong>Importe Total:</strong></td>
                    <td class="text-right text-lg font-bold">$ 360.00</td>
                </tr>
            </table>
        </div>

        <!-- QR Code and Observaciones -->
        <div class="mt-6 flex items-center">
            <div>
                <img src="https://cdn2.me-qr.com/qr/142123538.png?v=1732659484" alt="Código QR" class="qr-code">
            </div>
            <div class="ml-4 text-sm">
                <p>Representación Impresa de la Boleta de Venta Electrónica</p>
                <p><strong>SON:</strong> Trecientos Sesenta dolares </p>
                <p><strong>Comentarios: </strong> Gracias por su preferencia.</p>
            </div>
        </div>
    </div>
  <div class="fixed bottom-8 left-1/2 transform -translate-x-1/2 flex space-x-4">
    <button onclick="imprimirFactura()" class="bg-black text-white px-6 py-3 rounded border hover:bg-gray-800">Imprimir</button>
    <button onclick="guardarFactura()" class="bg-black text-white px-6 py-3 rounded border hover:bg-gray-800">Guardar</button>
</div>


    <script type="text/javascript">
      function imprimirFactura() {
        window.print();
      }

      function guardarFactura() {
        const factura = document.querySelector('body').innerHTML;
        const opt = {
          filename: 'factura.pdf',
          image: { type: 'jpeg', quality: 0.98 },
          html2canvas: { scale: 4 },
          jsPDF: { unit: 'mm', format: 'letter', orientation: 'portrait' }
        };
        html2pdf().from(factura).set(opt).save();
      }
    </script>
</body>

</html>
