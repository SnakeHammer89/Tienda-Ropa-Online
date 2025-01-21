-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2024 a las 20:11:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_ropa_online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `ID_Articulo` int(11) NOT NULL,
  `ID_Categoria` int(11) DEFAULT NULL,
  `ID_Color` int(11) DEFAULT NULL,
  `ID_Talla` int(11) DEFAULT NULL,
  `ID_Modelo` int(11) DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `Url_Imagen` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`ID_Articulo`, `ID_Categoria`, `ID_Color`, `ID_Talla`, `ID_Modelo`, `Precio`, `Stock`, `Url_Imagen`) VALUES
(1, 101, 201, 303, 401, 29.99, 50, 'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_640.jpg'),
(2, 102, 202, 304, 402, 19.99, 80, 'https://media.istockphoto.com/id/934203126/es/foto/en-blanco-blanco-camiseta-maqueta-sobre-suspensi%C3%B3n-de-madera-frente-y-parte-posterior-vista.jpg?s=2048x2048&w=is&k=20&c=XF1A29yktXfPOvWvQYijmswxBN3C4d4_DlZdF-MouS4='),
(3, 103, 203, 302, 403, 39.99, 60, 'https://cdn.pixabay.com/photo/2016/11/20/20/02/sweater-1843619_640.jpg'),
(4, 104, 204, 303, 404, 49.99, 30, 'https://cdn.pixabay.com/photo/2019/08/22/14/25/clothing-4423661_640.jpg'),
(5, 105, 205, 305, 405, 24.99, 40, 'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144_640.jpg'),
(6, 106, 206, 303, 406, 59.99, 20, 'https://cdn.pixabay.com/photo/2014/05/30/05/01/jackets-357898_1280.jpg'),
(7, 107, 207, 302, 411, 34.99, 25, 'https://cdn.pixabay.com/photo/2017/06/05/09/34/skirt-2373506_640.jpg'),
(8, 108, 208, 303, 412, 29.99, 35, 'https://cdn.pixabay.com/photo/2015/06/01/00/18/blouse-792803_640.jpg'),
(9, 109, 209, 304, 413, 39.99, 45, 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg'),
(10, 110, 210, 303, 410, 19.99, 15, 'https://cdn.pixabay.com/photo/2018/05/13/04/55/vest-3395391_640.png'),
(11, 101, 202, 301, 401, 29.99, 70, 'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_640.jpg'),
(12, 102, 203, 303, 402, 15.99, 90, 'https://media.istockphoto.com/id/934203126/es/foto/en-blanco-blanco-camiseta-maqueta-sobre-suspensi%C3%B3n-de-madera-frente-y-parte-posterior-vista.jpg?s=2048x2048&w=is&k=20&c=XF1A29yktXfPOvWvQYijmswxBN3C4d4_DlZdF-MouS4='),
(13, 103, 204, 304, 403, 44.99, 65, 'https://cdn.pixabay.com/photo/2016/11/20/20/02/sweater-1843619_640.jpg'),
(14, 104, 205, 302, 404, 69.99, 22, 'https://cdn.pixabay.com/photo/2019/08/22/14/25/clothing-4423661_640.jpg'),
(15, 105, 206, 305, 405, 22.99, 55, 'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144_640.jpg'),
(16, 106, 207, 306, 406, 79.99, 18, 'https://cdn.pixabay.com/photo/2014/05/30/05/01/jackets-357898_1280.jpg'),
(17, 107, 208, 302, 407, 24.99, 28, 'https://cdn.pixabay.com/photo/2017/06/05/09/34/skirt-2373506_640.jpg'),
(18, 108, 209, 304, 408, 34.99, 40, 'https://cdn.pixabay.com/photo/2015/06/01/00/18/blouse-792803_640.jpg'),
(19, 109, 210, 305, 409, 42.99, 35, 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg'),
(20, 110, 201, 304, 410, 27.99, 10, 'https://cdn.pixabay.com/photo/2018/05/13/04/55/vest-3395391_640.png'),
(21, 101, 202, 302, 401, 28.99, 75, 'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_640.jpg'),
(22, 102, 203, 304, 402, 18.99, 95, 'https://media.istockphoto.com/id/934203126/es/foto/en-blanco-blanco-camiseta-maqueta-sobre-suspensi%C3%B3n-de-madera-frente-y-parte-posterior-vista.jpg?s=2048x2048&w=is&k=20&c=XF1A29yktXfPOvWvQYijmswxBN3C4d4_DlZdF-MouS4='),
(23, 103, 204, 302, 403, 36.99, 70, 'https://cdn.pixabay.com/photo/2016/11/20/20/02/sweater-1843619_640.jpg'),
(24, 104, 205, 303, 404, 54.99, 20, 'https://cdn.pixabay.com/photo/2019/08/22/14/25/clothing-4423661_640.jpg'),
(25, 105, 206, 305, 405, 21.99, 45, 'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144_640.jpg'),
(26, 106, 207, 301, 406, 64.99, 15, 'https://cdn.pixabay.com/photo/2014/05/30/05/01/jackets-357898_1280.jpg'),
(27, 107, 208, 303, 411, 31.99, 32, 'https://cdn.pixabay.com/photo/2017/06/05/09/34/skirt-2373506_640.jpg'),
(28, 108, 209, 302, 412, 28.99, 38, 'https://cdn.pixabay.com/photo/2015/06/01/00/18/blouse-792803_640.jpg'),
(29, 109, 210, 304, 413, 41.99, 55, 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg'),
(30, 110, 201, 301, 410, 17.99, 14, 'https://cdn.pixabay.com/photo/2018/05/13/04/55/vest-3395391_640.png'),
(31, 101, 202, 301, 401, 27.99, 62, 'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_640.jpg'),
(32, 102, 203, 302, 402, 16.99, 88, 'https://media.istockphoto.com/id/934203126/es/foto/en-blanco-blanco-camiseta-maqueta-sobre-suspensi%C3%B3n-de-madera-frente-y-parte-posterior-vista.jpg?s=2048x2048&w=is&k=20&c=XF1A29yktXfPOvWvQYijmswxBN3C4d4_DlZdF-MouS4='),
(33, 103, 204, 303, 403, 37.99, 68, 'https://cdn.pixabay.com/photo/2016/11/20/20/02/sweater-1843619_640.jpg'),
(34, 104, 205, 301, 404, 67.99, 25, 'https://cdn.pixabay.com/photo/2019/08/22/14/25/clothing-4423661_640.jpg'),
(35, 105, 206, 305, 405, 23.99, 50, 'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144_640.jpg'),
(36, 106, 207, 306, 406, 75.99, 12, 'https://cdn.pixabay.com/photo/2014/05/30/05/01/jackets-357898_1280.jpg'),
(37, 107, 208, 302, 407, 25.99, 26, 'https://cdn.pixabay.com/photo/2017/06/05/09/34/skirt-2373506_640.jpg'),
(38, 108, 209, 303, 408, 30.99, 43, 'https://cdn.pixabay.com/photo/2015/06/01/00/18/blouse-792803_640.jpg'),
(39, 109, 210, 306, 409, 39.99, 33, 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg'),
(40, 110, 201, 303, 410, 26.99, 18, 'https://cdn.pixabay.com/photo/2018/05/13/04/55/vest-3395391_640.png'),
(41, 101, 202, 304, 401, 27.5, 72, 'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_640.jpg'),
(42, 102, 203, 302, 402, 19.5, 85, 'https://media.istockphoto.com/id/934203126/es/foto/en-blanco-blanco-camiseta-maqueta-sobre-suspensi%C3%B3n-de-madera-frente-y-parte-posterior-vista.jpg?s=2048x2048&w=is&k=20&c=XF1A29yktXfPOvWvQYijmswxBN3C4d4_DlZdF-MouS4='),
(43, 103, 204, 303, 403, 38.5, 65, 'https://cdn.pixabay.com/photo/2016/11/20/20/02/sweater-1843619_640.jpg'),
(44, 104, 205, 301, 404, 53.5, 25, 'https://cdn.pixabay.com/photo/2019/08/22/14/25/clothing-4423661_640.jpg'),
(45, 105, 206, 305, 405, 22.5, 60, 'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144_640.jpg'),
(46, 106, 207, 306, 406, 69.99, 17, 'https://cdn.pixabay.com/photo/2014/05/30/05/01/jackets-357898_1280.jpg'),
(47, 107, 208, 303, 411, 30.99, 27, 'https://cdn.pixabay.com/photo/2017/06/05/09/34/skirt-2373506_640.jpg'),
(48, 108, 209, 302, 412, 31.99, 36, 'https://cdn.pixabay.com/photo/2015/06/01/00/18/blouse-792803_640.jpg'),
(49, 109, 210, 304, 413, 39.5, 48, 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg'),
(50, 110, 201, 303, 410, 18.5, 21, 'https://cdn.pixabay.com/photo/2018/05/13/04/55/vest-3395391_640.png'),
(51, 101, 202, 301, 401, 26.99, 77, 'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_640.jpg'),
(52, 102, 203, 302, 402, 17.99, 84, 'https://media.istockphoto.com/id/934203126/es/foto/en-blanco-blanco-camiseta-maqueta-sobre-suspensi%C3%B3n-de-madera-frente-y-parte-posterior-vista.jpg?s=2048x2048&w=is&k=20&c=XF1A29yktXfPOvWvQYijmswxBN3C4d4_DlZdF-MouS4='),
(53, 103, 204, 303, 403, 42.99, 67, 'https://cdn.pixabay.com/photo/2016/11/20/20/02/sweater-1843619_640.jpg'),
(54, 104, 205, 306, 404, 64.99, 20, 'https://cdn.pixabay.com/photo/2019/08/22/14/25/clothing-4423661_640.jpg'),
(55, 105, 206, 305, 405, 25.99, 43, 'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144_640.jpg'),
(56, 106, 207, 303, 406, 79.99, 13, 'https://cdn.pixabay.com/photo/2014/05/30/05/01/jackets-357898_1280.jpg'),
(57, 107, 208, 302, 407, 23.99, 34, 'https://cdn.pixabay.com/photo/2017/06/05/09/34/skirt-2373506_640.jpg'),
(58, 108, 209, 304, 408, 33.99, 41, 'https://cdn.pixabay.com/photo/2015/06/01/00/18/blouse-792803_640.jpg'),
(59, 109, 210, 305, 409, 44.99, 30, 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg'),
(60, 110, 201, 303, 410, 24.99, 17, 'https://cdn.pixabay.com/photo/2018/05/13/04/55/vest-3395391_640.png'),
(61, 101, 202, 302, 401, 29.99, 70, 'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_640.jpg'),
(62, 102, 203, 303, 402, 16.99, 85, 'https://media.istockphoto.com/id/934203126/es/foto/en-blanco-blanco-camiseta-maqueta-sobre-suspensi%C3%B3n-de-madera-frente-y-parte-posterior-vista.jpg?s=2048x2048&w=is&k=20&c=XF1A29yktXfPOvWvQYijmswxBN3C4d4_DlZdF-MouS4='),
(63, 103, 204, 301, 403, 37.5, 74, 'https://cdn.pixabay.com/photo/2016/11/20/20/02/sweater-1843619_640.jpg'),
(64, 104, 205, 304, 404, 58.99, 20, 'https://cdn.pixabay.com/photo/2019/08/22/14/25/clothing-4423661_640.jpg'),
(65, 105, 206, 305, 405, 24.5, 42, 'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144_640.jpg'),
(66, 106, 207, 302, 406, 68.5, 16, 'https://cdn.pixabay.com/photo/2014/05/30/05/01/jackets-357898_1280.jpg'),
(67, 107, 208, 303, 411, 28.5, 30, 'https://cdn.pixabay.com/photo/2017/06/05/09/34/skirt-2373506_640.jpg'),
(68, 108, 209, 304, 412, 32.5, 34, 'https://cdn.pixabay.com/photo/2015/06/01/00/18/blouse-792803_640.jpg'),
(69, 109, 210, 306, 413, 37.99, 49, 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg'),
(70, 110, 201, 301, 410, 20.5, 19, 'https://cdn.pixabay.com/photo/2018/05/13/04/55/vest-3395391_640.png'),
(71, 101, 202, 303, 401, 25.5, 71, 'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_640.jpg'),
(72, 102, 203, 302, 402, 15.5, 89, 'https://media.istockphoto.com/id/934203126/es/foto/en-blanco-blanco-camiseta-maqueta-sobre-suspensi%C3%B3n-de-madera-frente-y-parte-posterior-vista.jpg?s=2048x2048&w=is&k=20&c=XF1A29yktXfPOvWvQYijmswxBN3C4d4_DlZdF-MouS4='),
(73, 103, 204, 305, 403, 36.5, 75, 'https://cdn.pixabay.com/photo/2016/11/20/20/02/sweater-1843619_640.jpg'),
(74, 104, 205, 303, 404, 57.5, 24, 'https://cdn.pixabay.com/photo/2019/08/22/14/25/clothing-4423661_640.jpg'),
(75, 105, 206, 306, 405, 23.5, 46, 'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144_640.jpg'),
(76, 106, 207, 303, 406, 67.5, 14, 'https://cdn.pixabay.com/photo/2014/05/30/05/01/jackets-357898_1280.jpg'),
(77, 107, 208, 301, 407, 26.5, 35, 'https://cdn.pixabay.com/photo/2017/06/05/09/34/skirt-2373506_640.jpg'),
(78, 108, 209, 302, 408, 34.5, 37, 'https://cdn.pixabay.com/photo/2015/06/01/00/18/blouse-792803_640.jpg'),
(79, 109, 210, 303, 409, 42.99, 30, 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg'),
(80, 110, 201, 305, 410, 27.99, 11, 'https://cdn.pixabay.com/photo/2018/05/13/04/55/vest-3395391_640.png'),
(81, 101, 202, 301, 401, 28.99, 60, 'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_640.jpg'),
(82, 102, 203, 302, 402, 16.99, 96, 'https://media.istockphoto.com/id/934203126/es/foto/en-blanco-blanco-camiseta-maqueta-sobre-suspensi%C3%B3n-de-madera-frente-y-parte-posterior-vista.jpg?s=2048x2048&w=is&k=20&c=XF1A29yktXfPOvWvQYijmswxBN3C4d4_DlZdF-MouS4='),
(83, 103, 204, 303, 403, 36.5, 69, 'https://cdn.pixabay.com/photo/2016/11/20/20/02/sweater-1843619_640.jpg'),
(84, 104, 205, 305, 404, 62.5, 28, 'https://cdn.pixabay.com/photo/2019/08/22/14/25/clothing-4423661_640.jpg'),
(85, 105, 206, 306, 405, 24.5, 50, 'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144_640.jpg'),
(86, 106, 207, 304, 406, 73.99, 19, 'https://cdn.pixabay.com/photo/2014/05/30/05/01/jackets-357898_1280.jpg'),
(87, 107, 208, 301, 411, 29.99, 31, 'https://cdn.pixabay.com/photo/2017/06/05/09/34/skirt-2373506_640.jpg'),
(88, 108, 209, 302, 412, 31.5, 40, 'https://cdn.pixabay.com/photo/2015/06/01/00/18/blouse-792803_640.jpg'),
(89, 109, 210, 303, 413, 40.5, 44, 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg'),
(90, 110, 201, 304, 410, 19.5, 12, 'https://cdn.pixabay.com/photo/2018/05/13/04/55/vest-3395391_640.png'),
(91, 101, 202, 303, 401, 27.5, 79, 'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_640.jpg'),
(92, 102, 203, 305, 402, 18.99, 83, 'https://media.istockphoto.com/id/934203126/es/foto/en-blanco-blanco-camiseta-maqueta-sobre-suspensi%C3%B3n-de-madera-frente-y-parte-posterior-vista.jpg?s=2048x2048&w=is&k=20&c=XF1A29yktXfPOvWvQYijmswxBN3C4d4_DlZdF-MouS4='),
(93, 103, 204, 302, 403, 35.5, 72, 'https://cdn.pixabay.com/photo/2016/11/20/20/02/sweater-1843619_640.jpg'),
(94, 104, 205, 301, 404, 59.99, 21, 'https://cdn.pixabay.com/photo/2019/08/22/14/25/clothing-4423661_640.jpg'),
(95, 105, 206, 305, 405, 26.99, 39, 'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144_640.jpg'),
(96, 106, 207, 304, 406, 76.99, 11, 'https://cdn.pixabay.com/photo/2014/05/30/05/01/jackets-357898_1280.jpg'),
(97, 107, 208, 303, 407, 27.99, 33, 'https://cdn.pixabay.com/photo/2017/06/05/09/34/skirt-2373506_640.jpg'),
(98, 108, 209, 302, 408, 33.99, 35, 'https://cdn.pixabay.com/photo/2015/06/01/00/18/blouse-792803_640.jpg'),
(99, 109, 210, 306, 409, 43.99, 29, 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_640.jpg'),
(100, 110, 201, 302, 410, 28.99, 13, 'https://cdn.pixabay.com/photo/2018/05/13/04/55/vest-3395391_640.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_proveedor`
--

CREATE TABLE `articulo_proveedor` (
  `ID_Articulo_Proveedor` int(11) NOT NULL,
  `ID_Articulo` int(11) DEFAULT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `iD_Carrito` int(11) NOT NULL,
  `iD_Cliente` int(11) DEFAULT NULL,
  `iD_Articulo` int(11) DEFAULT NULL,
  `cantidad_Articulo` int(11) DEFAULT NULL,
  `precio_Articulo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID_Categoria` int(11) NOT NULL,
  `Categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID_Categoria`, `Categoria`) VALUES
(101, 'Pantalon'),
(102, 'Camiseta'),
(103, 'Sudadera'),
(104, 'Vestido'),
(105, 'Pantalon Corto'),
(106, 'Chaqueta'),
(107, 'Falda'),
(108, 'Blusa'),
(109, 'Jeans'),
(110, 'Chaleco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_proveedor`
--

CREATE TABLE `categoria_proveedor` (
  `ID_Categoria_Proveedor` int(11) NOT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL,
  `ID_Categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Contrasenia` varchar(200) DEFAULT NULL,
  `Nombre` varchar(200) DEFAULT NULL,
  `Apellidos` varchar(200) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Direccion_Envio` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_Cliente`, `Email`, `Contrasenia`, `Nombre`, `Apellidos`, `Telefono`, `Direccion_Envio`) VALUES
(3, 'dasfsadfasdf', 'cvbfvbnyhjky', '67rurfhgv', 'vbnmhbmbc', '564216848/4', 'tgyjiyumn vb xvc'),
(4, 'a', 'a', 'markos', 'a', '21684984651', 'a'),
(5, 'b', 'b', 'Karen Melissa', 'bla bla bla', '123456789', 'm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `ID_Color` int(11) NOT NULL,
  `Color` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`ID_Color`, `Color`) VALUES
(201, 'Azul'),
(202, 'Blanco'),
(203, 'Negro'),
(204, 'Rojo'),
(205, 'Verde'),
(206, 'Gris'),
(207, 'Marron'),
(208, 'Amarillo'),
(209, 'Naranja'),
(210, 'Rosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Pedido` int(11) DEFAULT NULL,
  `ID_Articulo` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`ID_Detalle`, `ID_Pedido`, `ID_Articulo`, `Cantidad`, `Precio_Unitario`) VALUES
(10, 7, 41, 3, 27.50),
(11, 7, 66, 1, 68.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `ID_Modelo` int(11) NOT NULL,
  `Modelo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`ID_Modelo`, `Modelo`) VALUES
(401, 'Slim'),
(402, 'Basica'),
(403, 'Con capucha'),
(404, 'Formal'),
(405, 'Deportivo'),
(406, 'Invierno'),
(407, 'Corto'),
(408, 'Casual'),
(409, 'Recto'),
(410, 'Cool'),
(411, 'Largo'),
(412, 'Elegante'),
(413, 'Skinny');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`ID_Pedido`, `ID_Cliente`, `Fecha`) VALUES
(7, 5, '2024-12-11 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL,
  `Nombre` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `ID_Talla` int(11) NOT NULL,
  `Talla` enum('XS','S','M','L','XL','XXL') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`ID_Talla`, `Talla`) VALUES
(301, 'XS'),
(302, 'S'),
(303, 'M'),
(304, 'L'),
(305, 'XL'),
(306, 'XXL');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`ID_Articulo`),
  ADD KEY `fk_categoria` (`ID_Categoria`),
  ADD KEY `fk_color` (`ID_Color`),
  ADD KEY `fk_talla` (`ID_Talla`),
  ADD KEY `fk_modelo` (`ID_Modelo`);

--
-- Indices de la tabla `articulo_proveedor`
--
ALTER TABLE `articulo_proveedor`
  ADD PRIMARY KEY (`ID_Articulo_Proveedor`),
  ADD KEY `ID_Articulo` (`ID_Articulo`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`iD_Carrito`),
  ADD KEY `ID_Cliente` (`iD_Cliente`),
  ADD KEY `ID_Articulo` (`iD_Articulo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `categoria_proveedor`
--
ALTER TABLE `categoria_proveedor`
  ADD PRIMARY KEY (`ID_Categoria_Proveedor`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`ID_Color`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Pedido` (`ID_Pedido`),
  ADD KEY `ID_Articulo` (`ID_Articulo`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`ID_Modelo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`ID_Talla`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `ID_Articulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `articulo_proveedor`
--
ALTER TABLE `articulo_proveedor`
  MODIFY `ID_Articulo_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `iD_Carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `categoria_proveedor`
--
ALTER TABLE `categoria_proveedor`
  MODIFY `ID_Categoria_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`ID_Categoria`),
  ADD CONSTRAINT `fk_color` FOREIGN KEY (`ID_Color`) REFERENCES `color` (`ID_Color`),
  ADD CONSTRAINT `fk_modelo` FOREIGN KEY (`ID_Modelo`) REFERENCES `modelo` (`ID_Modelo`),
  ADD CONSTRAINT `fk_talla` FOREIGN KEY (`ID_Talla`) REFERENCES `talla` (`ID_Talla`);

--
-- Filtros para la tabla `articulo_proveedor`
--
ALTER TABLE `articulo_proveedor`
  ADD CONSTRAINT `articulo_proveedor_ibfk_1` FOREIGN KEY (`ID_Articulo`) REFERENCES `articulo` (`ID_Articulo`),
  ADD CONSTRAINT `articulo_proveedor_ibfk_2` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`);

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`ID_Articulo`) REFERENCES `articulo` (`ID_Articulo`);

--
-- Filtros para la tabla `categoria_proveedor`
--
ALTER TABLE `categoria_proveedor`
  ADD CONSTRAINT `categoria_proveedor_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`),
  ADD CONSTRAINT `categoria_proveedor_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`ID_Categoria`);

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedido` (`ID_Pedido`),
  ADD CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`ID_Articulo`) REFERENCES `articulo` (`ID_Articulo`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
