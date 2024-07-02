<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Ubuntu", sans-serif;
    }

    body {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        height: 100vh;
        background: url('https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0') no-repeat center center/cover; /* Background image */
        color: #fff; /* White text color for better contrast */
        padding-top: 20px; /* Padding to give space at the top */
    }

    .header {
        width: 100%;
        text-align: center;
        padding: 20px 0;
        background-color: rgba(0, 0, 0, 0.5); /* Match the background */
    }

    .header h1 {
        font-size: 40px;
        margin-bottom: 10px;
        color: #fff; /* Darker text for header */
    }

    .header p {
        font-size: 1.2em;
        color: #fff;
    }

    .mainContainer {
        width: 25rem;
        height: auto;
        border-radius: 1rem;
        background: rgba(220, 229, 227, 0.9);
        box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25),
                    0 10px 10px rgba(0, 0, 0, 0.22);
        padding: 20px;
        margin-top: 20px; /* Add margin to separate from header */
    }

    .searchInput {
        width: 100%;
        display: flex;
        padding: 1rem 1rem;
        justify-content: center;
    }

    .searchInput input {
        width: 100%;
        height: 2rem;
        outline: none;
        font-size: 1rem;
        color: #525050;
        padding: 0.2rem 0.5rem;
        border-radius: 1.5rem;
        border: 1px solid #b3b3b3;
    }

    .searchInput input:focus {
        border: 1px solid #9c9dde;
    }

    .searchInput button {
        width: 2.2rem;
        height: 2rem;
        cursor: pointer;
        color: #9b9b9b;
        border-radius: 50%;
        margin-left: 0.4rem;
        transition: all 0.3s ease;
        background-color: #fff;
        border: 1px solid #b3b3b3;
    }

    .searchInput button:hover {
        color: #fff;
        background-color: #9c9dde;
        border: 1px solid #9c9dde;
    }

    .weatherIcon {
        display: flex;
        padding-top: 0.5rem;
        padding-bottom: 0.5rem;
        justify-content: center;
    }

    .weatherIcon img {
        max-width: 100%;
        width: 8rem;
    }

    .weatherDetails .temp {
        color: #323232;
        font-size: 2rem;
    }

    .cityDetails {
        color: #323232;
        font-size: 2.5rem;
        text-align: center;
        margin-bottom: 0.5rem;
    }

    .cityDetails .date {
        color: #323232;
        font-size: 1.5rem;
        text-align: center;
        margin-bottom: 0.5rem;
    }

    .windDetails {
        display: flex;
        margin-top: 1rem;
        margin-bottom: 1.5rem;
        justify-content: space-around;
    }

    .windDetails .humidityBox {
        display: flex;
        font-size: 1rem;
        color: #323232;
    }

    .windDetails .humidity .humidityValue {
        text-align: center;
        font-size: 2rem;
        color: #323232;
    }

    .windDetails .humidityBox img {
        max-height: 3rem;
        margin-right: 0.5rem;
    }

    .windDetails .windSpeed {
        display: flex;
        font-size: 1rem;
        color: #323232;
    }

    .windDetails .windSpeed img {
        max-height: 3rem;
        margin-right: 0.5rem;
    }

    .image-logo {
        height: auto;
        width: auto;
        filter: drop-shadow(20px 10px 10px black);
    }
</style>

<body>
    <header class="header">
        <h1>Know the Weather Before You Go</h1>
        <p>Get real-time weather information for any location.</p>
    </header>
    <div class="mainContainer">
        <form action="WeatherServlet" method="post" class="searchInput">
            <input type="text" placeholder="Enter City Name" id="searchInput" value="" name="city" />
            <button id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
        <div class="weatherDetails">
            <div class="weatherIcon">
                <img src="" alt="Weather Icon" id="weather-icon">
                <h2 class="temp">${temperature} °C</h2>
                <input type="hidden" id="wc" value="${weatherCondition}">
            </div>
            <div class="cityDetails">
                <div class="desc"><strong>${city}</strong></div>
                <div class="date">${date}</div>
            </div>
            <div class="windDetails">
                <div class="humidityBox">
                    <img src="https://img.icons8.com/ios-filled/50/000000/humidity.png" alt="Humidity">
                    <div class="humidity">
                        <span>Humidity </span>
                        <h2>${humidity}% </h2>
                    </div>
                </div>
                <div class="windSpeed">
                    <img src="https://img.icons8.com/ios-filled/50/000000/wind.png" alt="Wind Speed">
                    <div class="wind">
                        <span>Wind Speed</span>
                        <h2>${windSpeed} km/h</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var weatherIcon = document.getElementById("weather-icon");

        var val = document.getElementById("wc").value;
        switch (val) {
            case 'Clouds':
                weatherIcon.src = "https://img.icons8.com/clouds/100/clouds.png";
                break;
            case 'Clear':
                weatherIcon.src = "https://img.icons8.com/dusk/100/smiling-sun.png";
                break;
            case 'Rain':
                weatherIcon.src = "https://img.icons8.com/external-flatart-icons-flat-flatarticons/100/external-rain-autumn-flatart-icons-flat-flatarticons.png";
                break;
            case 'Mist':
                weatherIcon.src = "https://img.icons8.com/ios-filled/100/000000/fog.png";
                break;
            case 'Snow':
                weatherIcon.src = "https://img.icons8.com/ios-filled/100/000000/snow.png";
                break;
            case 'Haze':
                weatherIcon.src = "https://img.icons8.com/external-filled-outline-geotatah/100/external-haze-overpopulation-filled-outline-filled-outline-geotatah.png";
                break;
        }
    </script>

</body>

</html>
