<%-- 
    Document   : Factura
    Created on : 1 dic. 2024, 20:19:38
    Author     : USUARIO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <title>Factura Electrónica</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>

    <script type="text/javascript">
      window.tailwind.config = {
        darkMode: ['class'],
        theme: {
          extend: {
            colors: {
              border: 'hsl(var(--border))',
              input: 'hsl(var(--input))',
              ring: 'hsl(var(--ring))',
              background: 'hsl(var(--background))',
              foreground: 'hsl(var(--foreground))',
              primary: {
                DEFAULT: 'hsl(var(--primary))',
                foreground: 'hsl(var(--primary-foreground))'
              },
              secondary: {
                DEFAULT: 'hsl(var(--secondary))',
                foreground: 'hsl(var(--secondary-foreground))'
              },
              destructive: {
                DEFAULT: 'hsl(var(--destructive))',
                foreground: 'hsl(var(--destructive-foreground))'
              },
              muted: {
                DEFAULT: 'hsl(var(--muted))',
                foreground: 'hsl(var(--muted-foreground))'
              },
              accent: {
                DEFAULT: 'hsl(var(--accent))',
                foreground: 'hsl(var(--accent-foreground))'
              },
              popover: {
                DEFAULT: 'hsl(var(--popover))',
                foreground: 'hsl(var(--popover-foreground))'
              },
              card: {
                DEFAULT: 'hsl(var(--card))',
                foreground: 'hsl(var(--card-foreground))'
              },
            },
          }
        }
      }
    </script>

    <style type="text/tailwindcss">
      @layer base {
        :root {
          --background: 0 0% 100%;
          --foreground: 240 10% 3.9%;
          --card: 0 0% 100%;
          --card-foreground: 240 10% 3.9%;
          --popover: 0 0% 100%;
          --popover-foreground: 240 10% 3.9%;
          --primary: 240 5.9% 10%;
          --primary-foreground: 0 0% 98%;
          --secondary: 240 4.8% 95.9%;
          --secondary-foreground: 240 5.9% 10%;
          --muted: 240 4.8% 95.9%;
          --muted-foreground: 240 3.8% 46.1%;
          --accent: 240 4.8% 95.9%;
          --accent-foreground: 240 5.9% 10%;
          --destructive: 0 84.2% 60.2%;
          --destructive-foreground: 0 0% 98%;
          --border: 240 5.9% 90%;
          --input: 240 5.9% 90%;
          --ring: 240 5.9% 10%;
          --radius: 0.5rem;
        }
        .dark {
          --background: 240 10% 3.9%;
          --foreground: 0 0% 98%;
          --card: 240 10% 3.9%;
          --card-foreground: 0 0% 98%;
          --popover: 240 10% 3.9%;
          --popover-foreground: 0 0% 98%;
          --primary: 0 0% 98%;
          --primary-foreground: 240 5.9% 10%;
          --secondary: 240 3.7% 15.9%;
          --secondary-foreground: 0 0% 98%;
          --muted: 240 3.7% 15.9%;
          --muted-foreground: 240 5% 64.9%;
          --accent: 240 3.7% 15.9%;
          --accent-foreground: 0 0% 98%;
          --destructive: 0 62.8% 30.6%;
          --destructive-foreground: 0 0% 98%;
          --border: 240 3.7% 15.9%;
          --input: 240 3.7% 15.9%;
          --ring: 240 4.9% 83.9%;
        }
      }
    </style>
  </head>
  <body>
    <div class="max-w-2xl mx-auto p-4 bg-white dark:bg-card rounded-lg shadow-md">
      <div class="flex items-center justify-between">
        <h1 class="text-2xl font-bold text-primary">FACTURA ELECTRÓNICA</h1>
        <img src="../img/SA.png" alt="Logo" class="w-20 h-20 object-contain">
      </div>
      <div class="mt-4">
        <p class="text-muted-foreground">RUC: 20605313401</p>
        <p class="text-muted-foreground">FACTURACION ELECTRONICA Funeraria Los Alamos</p>
        <p class="text-muted-foreground">Domingo Cueto 369 Int.102 Espalda del Hospital Rebaliategui - Lince</p>
        <p class="text-muted-foreground">Forma de pago: Tarjeta de crédito</p>
      </div>
      <div class="mt-6">
        <p class="font-semibold">Cliente: Hector De La Cruz</p>
        <p class="text-muted-foreground">DNI: 92006254</p>
        <p class="text-muted-foreground">Av. Morales Duarez 168</p>
        <p class="text-muted-foreground">Moneda: dólares</p>
      </div>
      <div class="mt-6">
        <p class="font-semibold">FF03-53953</p>
        <p class="text-muted-foreground">Fecha de emisión: 2024-12-04 </p>
        <p class="text-muted-foreground">Vendedor: Juan Perez</p>
      </div>
      <table class="min-w-full mt-6 border border-border">
        <thead>
          <tr class="bg-muted text-muted-foreground">
            <th class="border border-border p-2">N.S</th>
            <th class="border border-border p-2">Plan-Servicio</th>
            <th class="border border-border p-2">Servicio</th>
            <th class="border border-border p-2">Precio Unitario</th>
            <th class="border border-border p-2">Total</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="border border-border p-2">1</td>
            <td class="border border-border p-2">Premiun</td>
            <td class="border border-border p-2">Cremacion</td>
            <td class="border border-border p-2">$300.00</td>
            <td class="border border-border p-2">$300.00</td>
          </tr>
          <tr>
            <td class="border border-border p-2"></td>
            <td class="border border-border p-2"></td>
            <td class="border border-border p-2"></td>
            <td class="border border-border p-2"></td>
            <td class="border border-border p-2"></td>
          </tr>
        </tbody>
      </table>
      <div class="mt-4">
        <p class="font-semibold">Son: Trecientos Sesenta dolares</p>
        <p class="mt-2">Gravada: $300.00</p>
        <p>IGV: 18%: $60.00</p>
        <p class="font-bold">Total: $360.00</p>
      </div>
      <div class="mt-6">
        <p class="text-muted-foreground">Gracias por su Preferencia</p>
      </div>
      <div class="mt-4">
        <img aria-hidden="true" alt="QR Code" src="https://cdn2.me-qr.com/qr/142123538.png?v=1732659484" class="w-24 h-24" />
        <p class="mt-2">Representación Impresa de la Boleta de Venta Electrónica</p>
      </div>
      <div class="mt-6 flex justify-between">
        <button onclick="imprimirFactura()" class="bg-primary text-white px-4 py-2 rounded">Imprimir</button>
        <button onclick="guardarFactura()" class="bg-primary text-white px-4 py-2 rounded">Guardar</button>
      </div>
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
