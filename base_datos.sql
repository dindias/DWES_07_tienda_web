-- MySQL dump 10.13  Distrib 5.7.20, for macos10.12 (x86_64)
--
-- Host: localhost    Database: dwes
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dwes`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dwes` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;

USE `dwes`;

--
-- Table structure for table `familia`
--

DROP TABLE IF EXISTS `familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familia` (
  `cod` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia`
--

LOCK TABLES `familia` WRITE;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
INSERT INTO `familia` VALUES ('CAMARA','Cámaras digitales'),('CONSOL','Consolas'),('EBOOK','Libros electrónicos'),('IMPRES','Impresoras'),('MEMFLA','Memorias flash'),('MP3','Reproductores MP3'),('MULTIF','Equipos multifunción'),('NETBOK','Netbooks'),('ORDENA','Ordenadores'),('PORTAT','Ordenadores portátiles'),('ROUTER','Routers'),('SAI','Sistemas de alimentación ininterrumpida'),('SOFTWA','Software'),('TV','Televisores'),('VIDEOC','Videocámaras');
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `cod` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_corto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `PVP` decimal(10,2) NOT NULL,
  `familia` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `nombre_corto` (`nombre_corto`),
  KEY `familia` (`familia`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`familia`) REFERENCES `familia` (`cod`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('3DSNG',NULL,'Nintendo 3DS negro','Consola portátil de Nintendo que permitirá disfrutar de efectos 3D sin necesidad de gafas especiales, e incluirá retrocompatibilidad con el software de DS y de DSi.',270.00,'CONSOL'),('ACERAX3950',NULL,'Acer AX3950 I5-650 4GB 1TB W7HP','Características:\r\n\r\nSistema Operativo : Windows 7 Home Premium Original\r\n\r\nProcesador / Chipset\r\nNúmero de Ranuras PCI: 1\r\nFabricante de Procesador: Intel\r\nTipo de Procesador: Core i5\r\nModelo de Procesador: i5-650\r\nNúcleo de Procesador: Dual-core\r\nVelocidad de Procesador: 3,20 GHz\r\nCaché: 4 MB\r\nVelocidad de Bus: No aplicable\r\nVelocidad HyperTransport: No aplicable\r\nInterconexión QuickPathNo aplicable\r\nProcesamiento de 64 bits: S�\r\nHyper-ThreadingS�\r\nFabricante de Chipset: Intel\r\nModelo de Chipset: H57 Express\r\n\r\nMemoria\r\nMemoria Estándar: 4 GB\r\nMemoria Máxima: 8 GB\r\nTecnología de la Memoria: DDR3 SDRAM\r\nEstándar de Memoria: DDR3-1333/PC3-10600\r\nNúmero de Ranuras de Memoria (Total): 4\r\nLector de tarjeta memoria: S�\r\nSoporte de Tarjeta de Memoria: Tarjeta CompactFlash (CF)\r\nSoporte de Tarjeta de Memoria: MultiMediaCard (MMC)\r\nSoporte de Tarjeta de Memoria: Micro Drive\r\nSoporte de Tarjeta de Memoria: Memory Stick PRO\r\nSoporte de Tarjeta de Memoria: Memory Stick\r\nSoporte de Tarjeta de Memoria: CF+\r\nSoporte de Tarjeta de Memoria: Tarjeta Secure Digital (SD)\r\n\r\nStorage\r\nCapcidad Total del Disco Duro: 1 TB\r\nRPM de Disco Duro: 5400\r\nTipo de Unidad óptica: Grabadora DVD\r\nCompatibilidad de Dispositivo óptico: DVD-RAM/�R/�RW\r\nCompatibilidad de Medios de Doble Capa: S�',410.00,'ORDENA'),('ARCLPMP32GBN',NULL,'Archos Clipper MP3 2GB negro','Características:\r\n\r\nAlmacenamiento Interno Disponible en 2 GB*\r\nCompatibilidad Windows o Mac y Linux (con soporte para almacenamiento masivo)\r\nInterfaz para ordenador USB 2.0 de alta velocidad\r\nBatter�a2 11 horas música\r\nReproducción Música3 MP3\r\nMedidas Dimensiones: 52mm x 27mm x 12mm, Peso: 14 Gr',26.70,'MP3'),('BRAVIA2BX400',NULL,'Sony Bravia 32IN FULLHD KDL-32BX400','Características:\r\n\r\nFull HD: Vea deportes películas y juegos con magníficos detalles en alta resolución gracias a la resolución 1920x1080.\r\n\r\nHDMI�: 4 entradas (3 en la parte posterior, 1 en el lateral)\r\n\r\nUSB Media Player: Disfrute de películas, fotos y música en el televisor.\r\n\r\nSintonizador de TV HD MPEG-4 AVC integrado: olvídese del codificador y acceda a servicios de TV que incluyen canales HD con el sintonizador DVB-T y DVB-C integrado con decodificador MPEG4 AVC (dependiendo del país y sólo con operadores compatibles)\r\n\r\nSensor de luz: ajusta automáticamente el brillo según el nivel de la iluminación ambiental para que pueda disfrutar de una calidad de imagen óptima sin consumo innecesario de energía.\r\n\r\nBRAVIA Sync: controle su sistema de ocio doméstico entero con un mismo mando a distancia universal que le permite reproducir contenidos o ajustar la configuración de los dispositivos compatibles con un solo botón.\r\n\r\nBRAVIA ENGINE 2: experimente colores y detalles de imagen increíblemente nítidos y definidos. \r\n\r\nLive Colour�: seleccione entre cuatro modos: desactivado, bajo, medio y alto, para ajustar el color y obtener imágenes vivas y una calidad óptima. \r\n\r\n24p True Cinema�: reproduzca una auténtica experiencia cinemótica y disfrute de películas exactamente como el director las concibió a 24 fotogramas por segundo.',356.90,'TV'),('EEEPC1005PXD',NULL,'Asus EEEPC 1005PXD N455 1 250 BL','Características:\r\nProcesador: 1660 MHz, N455, Intel Atom, 0.5 MB. \r\nMemoria: 1024 MB, 2 GB, DDR3, SO-DIMM, 1 x 1024 MB. \r\nAccionamiento de disco: 2.5 \", 250 GB, 5400 RPM, \r\nSerial ATA, Serial ATA II, 250 GB. \r\nMedios de almacenaje: MMC, SD, SDHC. \r\nExhibici�n: 10.1 \", 1024 x 600 Pixeles, LCD TFT. \r\nC�mara fotogr�fica: 0.3 MP. \r\nRed: 802.11 b/g/n, 10, 100 Mbit/s, \r\nFast Ethernet. \r\nAudio: HD. \r\nSistema operativo/software: Windows 7 Starter. \r\nColor: Blanco. \r\nContro de energ�a: 8 MB/s, Litio-Ion, 6 piezas, 2200 mAh, 48 W. \r\nPeso y dimensiones: 1270 g, 178 mm, 262 mm, 25.9 mm, 36.5 mm',245.40,'NETBOK'),('HPMIN1103120',NULL,'HP Mini 110-3120 10.1LED N455 1GB 250GB W7S negro','Caracter�sticas:\r\nSistema operativo instalado \r\nWindows� 7 Starter original 32 bits \r\n\r\nProcesador \r\nProcesador Intel� Atom� N4551,66 GHz, Cache de nivel 2, 512 KB \r\n\r\nChipset NM10 Intel� + ICH8m \r\n\r\nMemoria \r\nDDR2 de 1 GB (1 x 1024 MB) \r\nMemoria m�xima \r\nAdmite un m�ximo de 2 GB de memoria DDR2 \r\n\r\nRanuras de memoria \r\n1 ranura de memoria accesible de usuario \r\n\r\nUnidades internas \r\nDisco duro SATA de 250 GB (5400 rpm) \r\n\r\nGr�ficos \r\nTama�o de pantalla (diagonal) \r\nPantalla WSVGA LED HP Antirreflejos de 25,6 cm (10,1\") en diagonal \r\n\r\nResoluci�n de la pantalla \r\n1024 x 600 ',270.00,'NETBOK'),('IXUS115HSAZ',NULL,'Canon Ixus 115HS azul','Caracter�sticas:\r\nHS System (12,1 MP) \r\nZoom 4x, 28 mm. IS �ptico \r\nCuerpo met�lico estilizado \r\nPantalla LCD PureColor II G de 7,6 cm (3,0\") \r\nFull HD. IS Din�mico. HDMI \r\nModo Smart Auto (32 escenas) ',196.70,'CAMARA'),('KSTDT101G2',NULL,'Kingston DataTraveler 16GB DT101G2 USB2.0 negro','Caracter�sticas:\r\nCapacidades � 16GB\r\nDimensiones � 2.19\" x 0.68\" x 0.36\" (55.65mm x 17.3mm x 9.05mm)\r\nTemperatura de Operaci�n � 0� hasta 60� C / 32� hasta 140� F\r\nTemperatura de Almacenamiento � -20� hasta 85� C / -4� hasta 185� F\r\nSimple � Solo debe conectarlo a un puerto USB y est� listo para ser utilizado\r\nPractico � Su dise�o sin tapa giratorio, protege el conector USB; sin tapa que perder\r\nGarantizado � Cinco a�os de garant�a',19.20,'MEMFLA'),('KSTDTG332GBR',NULL,'Kingston DataTraveler G3 32GB rojo','Caracter�sticas:\r\n\r\nTipo de producto Unidad flash USB\r\nCapacidad almacenamiento32GB\r\nAnchura 58.3 mm\r\nProfundidad 23.6 mm\r\nAltura 9.0 mm\r\nPeso 12 g\r\nColor incluido RED\r\nTipo de interfaz USB',40.00,'MEMFLA'),('KSTMSDHC8GB',NULL,'Kingston MicroSDHC 8GB','Kingston tarjeta de memoria flash 8 GB microSDHC\r\n�ndice de velocidad    Class 4\r\nCapacidad almacenamiento    8 GB\r\nFactor de forma  MicroSDHC\r\nAdaptador de memoria incluido   Adaptador microSDHC a SD\r\nGarant�a del fabricante   Garant�a limitada de por vida',10.20,'MEMFLA'),('LEGRIAFS306',NULL,'Canon Legria FS306 plata','Caracter�sticas:\r\n\r\nGrabaci�n en tarjeta de memoria SD/SDHC \r\nLa c�mara de v�deo digital de Canon m�s peque�a nunca vista \r\nInstant�nea de V�deo (Video Snapshot) \r\nZoom Avanzado de 41x \r\nGrabaci�n Dual (Dual Shot) \r\nEstabilizador de la Imagen con Modo Din�mico \r\nPre grabaci�n (Pre REC) \r\nSistema 16:9 de alta resoluci�n realmente panor�mico \r\nBater�a inteligente y Carga R�pida \r\nCompatible con grabador de DVD DW-100 \r\nSISTEMA DE V�DEO\r\nSoporte de grabaci�n: Tarjeta de memoria extra�ble (SD/SDHC)\r\nTiempo m�ximo de grabaci�n: Variable, dependiendo del tama�o de la tarjeta de memoria.\r\nTarjeta SDHC de 32 GB: 20 horas 50 minutos',175.00,'VIDEOC'),('LGM237WDP',NULL,'LG TDT HD 23 M237WDP-PC FULL HD','Caracter�sticas:\r\n\r\nGeneral\r\nTama�o (pulgadas): 23\r\nPantalla LCD: S�\r\nFormato: 16:9\r\nResoluci�n: 1920 x 1080\r\nFull HD: S�\r\nBrillo (cd/m2): 300\r\nRatio Contraste: 50.000:1\r\nTiempo Respuesta (ms): 5\r\n�ngulo Visi�n (�): 170\r\nN�mero Colores (Millones): 16.7\r\n\r\nTV\r\nTDT: TDT HD\r\nConexiones\r\nD-Sub: S�\r\nDVI-D: S�\r\nHDMI: S�\r\nEuroconector: S�\r\nSalida auriculares: S�\r\nEntrada audio: S�\r\nUSB Servicio: S�\r\nRS-232C Servicio: S�\r\nPCMCIA: S�\r\nSalida �ptico: S�',186.00,'TV'),('LJPROP1102W',NULL,'HP Laserjet Pro Wifi P1102W','Impesora laserjet P1102W es facil de instalar y usar, ademas de que te ayudara a ahorrar energia y recursos. \r\nOlviadte de los cables y disfura de la libertad que te proporcina su tecnologia WIFI, imprime facilmente desdes cualquier de tu oficina. \r\n\r\nFormato m�ximo aceptado A4 A2 No\r\nA3 NoA4 Si\r\nA5 SiA6 Si\r\nB5 SiB6 Si\r\nSobres C5 (162 x 229 mm) SiSobres C6 (114 x 162 mm) Si',99.90,'IMPRES'),('OPTIOLS1100',NULL,'Pentax Optio LS1100','La LS1100 con funda de transporte y tarjeta de memoria de 2GB incluidas \r\nes la compacta digital que te llevar�s a todas partes. \r\nEsta c�mara dise�ada por Pentax incorpora un sensor CCD de 14,1 megap�xeles y un objetivo gran angular de 28 mm.\r\n',104.80,'CAMARA'),('PAPYRE62GB',NULL,'Lector ebooks Papyre6 con SD2GB + 500 ebooks','Marca Papyre \r\nModelo Papyre 6.1 \r\nUso Lector de libros electr�nicos \r\nTecnolog�a e-ink (tinta electr�nica, Vizplez) \r\nCPU Samsung Am9 200MHz \r\nMemoria - Interna: 512MB \r\n- Externa: SD/SDHC (hasta 32GB) \r\nFormatos PDF, RTF, TXT, DOC, HTML, MP3, CHM, ZIP, FB2, Formatos de imagen \r\nPantalla 6\" (600x800px), blanco y negro, 4 niveles de grises ',205.50,'EBOOK'),('PBELLI810323',NULL,'Packard Bell I8103 23 I3-550 4G 640GB NVIDIAG210','Caracter�sticas:\r\n\r\nCPU CHIPSET\r\n\r\nProcesador : Ci3-550\r\nNorthBridge : Intel H57\r\n\r\nMEMORIA\r\nMemoria Rma : Ddr3 4096 MB\r\n\r\nDISPOSITIVOS DE ALMACENAMIENTO\r\nDisco Duro: 640Gb 7200 rpm\r\n�ptico : Slot Load siper multi Dvdrw\r\nLector de Tarjetas: 4 in 1 (XD, SD, HC, MS, MS PRO, MMC)\r\n\r\ndispositivos gr�ficos\r\nMonitor: 23 fHD\r\nTarjeta Gr�fica: Nvidia G210M D3 512Mb\r\nMemoria M�xima: Hasta 1918Mb\r\n\r\nAUDIO\r\nAudio Out: 5.1 Audio Out\r\nAudio In: 1 jack\r\nHeasphone in: 1x jack\r\nAltavoces: Stereo\r\n\r\nACCESORIOS\r\nTeclado: Teclado y rat�n inal�mbrico\r\nMando a distancia: EMEA Win7 WMC\r\n\r\n\r\nCOMUNICACIONES\r\nWireless: 802.11 b/g/n mini card \r\nTarjeta de Red: 10/100/1000 Mbps\r\nBluetooth: Bluethoot\r\nWebcam: 1Mpixel Hd (1280x720)\r\nTv tuner: mCARD/SW/ DVB-T\r\n\r\nMONITOR\r\nTama�o: 23\"\r\ncontraste: 1000:1\r\nTiempo de respuesta: 5MS\r\nResoluci�n: 1920 X 1080\r\n\r\nPUERTOS E/S\r\nUsb 2.0 : 6\r\nMini Pci-e : 2\r\nEsata: 1\r\n\r\nSISTEMA OPERATIVO\r\nO.S: Microsoft Windows 7 Premium',761.80,'ORDENA'),('PIXMAIP4850',NULL,'Canon Pixma IP4850','Caracter�sticas:\r\n\r\nTipo: chorro de tinta cartuchos independientes\r\nConexi�n: Hi-Speed USB\r\nPuerto de impresi�n directa desde camaras\r\nResoluci�n m�xima: 9600x2400 ppp\r\nVelocidad impresi�n: 11 ipm (negro) / 9.3 ipm (color)\r\nTama�o m�ximo papel: A4\r\nBandeja entrada: 150 hojas\r\nDimensiones: 43.1 cm x 29.7 cm x 15.3 cm',97.30,'IMPRES'),('PIXMAMP252',NULL,'Canon Pixma MP252','Caracter�sticas:\r\n\r\nFunciones: Impresora, Esc�ner , Copiadora\r\nConexi�n: USB 2.0\r\nDimensiones:444 x 331 x 155 mm\r\nPeso: 5,8 Kg\r\n\r\nIMPRESORA\r\nResoluci�n m�xima: 4800 x 1200 ppp\r\nVelocidad de impresi�n:\r\nNegro/color: 7,0 ipm / 4,8 ipm\r\nTama�o m�ximo papel: A4\r\nCARTUCHOS\r\nNegro: PG-510 / PG-512\r\nColor: CL-511 / CL-513\r\n\r\nESCANER\r\nResoluci�n m�xima: 600 x 1200 ppp (digital: 19200 x 19200)\r\nProfundidad de color: 48/24 bits\r\nArea m�xima de escaneado: A4\r\n\r\nCOPIA\r\nTiempo salida 1� copia: aprox 39 seg.',41.60,'MULTIF'),('PS3320GB','','PS3','Este Pack Incluye:\r\n- La consola Playstation 3 Slim Negra 320GB\r\n- El juego Killzone 3\r\n        ',380.00,'CONSOL'),('PWSHTA3100PT',NULL,'Canon Powershot A3100 plata','La c�mara PowerShot A3100 IS, inteligente y compacta, presenta la calidad de imagen de Canon en un cuerpo\r\ncompacto y ligero para capturar fotograf�as sin esfuerzo; es tan f�cil como apuntar y disparar.\r\nCaracter�sticas:\r\n12,1 MP \r\nZoom �ptico 4x con IS \r\nPantalla LCD de 6,7 cm (2,7\") ',101.40,'CAMARA'),('SMSGCLX3175',NULL,'Samsung CLX3175','Caracter�sticas:\r\n\r\nFunci�n: Impresi�n color, copiadora, esc�ner\r\nImpresi�n \r\nVelocidad (Mono)Hasta 16 ppm en A4 (17 ppm en Carta)\r\nVelocidad (Color)Hasta 4 ppm en A4 (4 ppm en Carta)\r\nSalida de la Primer P�gina (Mono)Menos de 14 segundos (Desde el Modo Listo)\r\nResoluci�nHasta 2400 x 600 dpi de salida efectiva\r\nSalida de la Primer P�gina (Color)Menos de 26 segundos (Dese el Modo Listo)\r\nDuplexManual\r\nEmulaci�nSPL-C (Lenguaje de color de impresi�n SAMSUNG)\r\n\r\nCopiado \r\nSalida de la Primer P�gina (Mono)18 segundos\r\nMulticopiado1 ~ 99\r\nZoom25 ~ 400 %\r\nFunciones de CopiadoCopia ID, Clonar Copia, Copia N-UP, Copiar Poster\r\nResoluci�nTexto, Texto / Foto, Modo Revista: hasta 600 x 600 ppp, Modo Foto: Hasta 1200 x 1200 ppp\r\nVelocidad (Mono)Hasta 17 ppm en Carta (16 ppm en A4)\r\nVelocidad (Color)Hasta 4 ppm en Carta (4 ppm en A4 )\r\nSalida de la Primer P�gina (Color)45 segundos\r\n\r\nEscaneado \r\n\r\nCompatibilidadNorma TWAIN, Norma WIA (Windows2003 / XP / Vista)\r\nM�todoEsc�ner plano color\r\nResoluci�n (�ptica)1200 x 1200 dpi\r\nResoluci�n (Mejorada)4800 x 4800 dpi\r\nEscaneado a Escanear a USB / Carpeta',190.00,'MULTIF'),('SMSN150101LD',NULL,'Samsung N150 10.1LED N450 1GB 250GB BAT6 BT W7 R','Caracter�sticas:\r\n\r\nSistema Operativo Genuine Windows� 7 Starter \r\n\r\nProcesador Intel� ATOM Processor N450 (1.66GHz, 667MHz, 512KB) \r\n\r\nChipset Intel� NM10\r\n\r\nMemoria del Sistema 1GB (DDR2 / 1GB x 1) Ranura de Memoria 1 x SODIMM \r\n\r\nPantalla LCD 10.1\" WSVGA (1024 x 600), Non-Gloss, LED Back Light Gr�ficos \r\n\r\nProcesador Gr�fico Intel� GMA 3150 DVMT \r\nMemoria Gr�fica Shared Memory (Int. Grahpic) \r\n\r\nMultimedia \r\nSonido HD (High Definition) Audio \r\nCaracter�sticas de Sonido SRS 3D Sound Effect \r\nAltavoces 3W Stereo Speakers (1.5W x 2) \r\nC�mara Integrada Web Camera \r\n\r\nAlmacenamiento \r\nDisco duro 250GB SATA (5400 rpm S-ATA) \r\n\r\nConectividad\r\nWired Ethernet LAN (RJ45) 10/100 LAN \r\nWireless LAN 802.11 b/g/N\r\n\r\nBluetooth Bluetooth 3.0 High Speed \r\n\r\nI/O Port \r\nVGA \r\nHeadphone-out\r\nMic-in\r\nInternal Mic\r\nUSB (Chargable USB included) 3 x USB 2.0 \r\nMulti Card Slot 4-in-1 (SD, SDHC, SDXC, MMC)\r\nDC-in (Power Port)\r\n\r\nTipo de Teclado 84 keys \r\nTouch Pad, Touch Screen Touch Pad (Scroll Scope, Flat Type) \r\n\r\nSeguridad\r\nRecovery Samsung Recovery Solution \r\nVirus McAfee Virus Scan (trial version) \r\nSeguridad BIOS Boot Up Password / HDD Password \r\nBloqueo Kensington Lock Port \r\n\r\nBater�a \r\nAdaptador 40 Watt Bater�a \r\n6 Cell Dimensiones ',260.60,'NETBOK'),('SMSSMXC200PB',NULL,'Samsung SMX-C200PB EDC ZOOM 10X','Caracter�sticas:\r\n\r\nSensor de Imagen Tipo 1 / 6� 800K pixel CCD\r\n\r\nLente Zoom �ptico 10 x optico\r\n\r\nCaracter�sticas Grabaci�n V�deo Estabilizador de Imagen Hiper estabilizador de imagen digital\r\n\r\nInterfaz Tarjeta de Memoria Ranura de Tarjeta SDHC / SD',127.20,'VIDEOC'),('STYLUSSX515W',NULL,'Epson Stylus SX515W','Caracter�sticas:\r\n\r\nResoluci�n m�xima5760 x 1440 DPI\r\nVelocidad de la impresi�n\r\nVelocidad de impresi�n (negro, calidad normal, A4)36 ppm\r\nVelocidad de impresi�n (color, calidad normal, A4)36 ppm\r\n\r\nTecnolog�a de la impresi�n\r\nTecnolog�a de impresi�n inyecci�n de tinta\r\nN�mero de cartuchos de impresi�n4 piezas\r\nCabeza de impresoraMicro Piezo\r\n\r\nExploraci�n\r\nResoluci�n m�xima de escaneado2400 x 2400 DPI\r\nEscaner color: si\r\nTipo de digitalizaci�n Esc�ner plano\r\nEscanaer integrado: si\r\nTecnolog�a de exploraci�n CIS\r\nWLAN, conexi�n: si',77.50,'MULTIF'),('TSSD16GBC10J',NULL,'Toshiba SD16GB Class10 Jewel Case','Caracter�sticas:\r\n\r\nDensidad: 16 GB\r\nPINs de conexi�n: 9 pins\r\nInterfaz: Tarjeta de memoria SD standard compatible\r\nVelocidad de Escritura: 20 MBytes/s* \r\nVelocidad de Lectura: 20 MBytes/s*\r\nDimensiones: 32.0 mm (L) � 24.0 mm (W) � 2.1 mm (H)\r\nPeso: 2g\r\nTemperatura: -25�C a +85�C (Recomendada)\r\nHumedad: 30% to 80% RH (sin condensaci�n)',32.60,'MEMFLA'),('ZENMP48GB300',NULL,'Creative Zen MP4 8GB Style 300','Caracter�sticas:\r\n\r\n8 GB de capacidad\r\nAutonom�a: 32 horas con archivos MP3 a 128 kbps\r\nPantalla TFT de 1,8 pulgadas y 64.000 colores\r\nFormatos de audio compatibles: MP3, WMA (DRM9), formato Audible 4\r\nFormatos de foto compatibles: JPEG (BMP, TIFF, GIF y PNG\r\nFormatos de v�deo compatibles: AVI transcodificado (Motion JPEG)\r\nEcualizador de 5 bandas con 8 preajustes\r\nMicr�fono integrado para grabar voz\r\nAltavoz y radio FM incorporada',58.90,'MP3');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `producto` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `tienda` int(11) NOT NULL,
  `unidades` int(11) NOT NULL,
  PRIMARY KEY (`producto`,`tienda`),
  KEY `stock_ibfk_2` (`tienda`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`producto`) REFERENCES `producto` (`cod`) ON UPDATE CASCADE,
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`tienda`) REFERENCES `tienda` (`cod`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('3DSNG',1,2),('3DSNG',2,1),('ACERAX3950',1,1),('ARCLPMP32GBN',2,1),('ARCLPMP32GBN',3,2),('BRAVIA2BX400',3,1),('EEEPC1005PXD',1,2),('EEEPC1005PXD',2,1),('HPMIN1103120',2,1),('HPMIN1103120',3,2),('IXUS115HSAZ',2,2),('KSTDT101G2',3,1),('KSTDTG332GBR',2,2),('KSTMSDHC8GB',1,1),('KSTMSDHC8GB',2,2),('KSTMSDHC8GB',3,2),('LEGRIAFS306',2,1),('LGM237WDP',1,1),('LJPROP1102W',2,2),('OPTIOLS1100',1,3),('OPTIOLS1100',2,1),('PAPYRE62GB',1,2),('PAPYRE62GB',3,1),('PBELLI810323',2,1),('PIXMAIP4850',2,1),('PIXMAIP4850',3,2),('PIXMAMP252',2,1),('PS3320GB',1,1),('PWSHTA3100PT',2,2),('PWSHTA3100PT',3,2),('SMSGCLX3175',2,1),('SMSN150101LD',3,1),('SMSSMXC200PB',2,1),('STYLUSSX515W',1,1),('TSSD16GBC10J',3,2),('ZENMP48GB300',1,3),('ZENMP48GB300',2,2),('ZENMP48GB300',3,2);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tienda` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tlf` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,'CENTRAL','600100100'),(2,'SUCURSAL1','600100200'),(3,'SUCURSAL2',NULL);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('dwes','e8dc8ccd5e5f9e3a54f07350ce8a2d3d','avanza','mérida'),('tbo','1d51cd4fc605dd5324f91ea1bafb05bb','pepe','gotera');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-08 11:12:18
