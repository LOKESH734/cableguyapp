<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Packages - MyCable</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            padding: 20px;
        }

        .package {
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 20px;
        }

        .package h3 {
            margin-top: 0;
        }

        .channel-list img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }

        .channel {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .channel label {
            margin-left: 10px;
        }

        .total-cost {
            font-weight: bold;
            margin-top: 20px;
        }

        .submit-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    <script>
        var totalCost = 0;

        function updateTotalCost(amount) {
            totalCost += amount;
            document.getElementById("totalCost").innerText = "Total Cost: ₹" + totalCost;
        }

        function handleCheckboxChange(checkbox, amount) {
            if (checkbox.checked) {
                updateTotalCost(amount);
            } else {
                updateTotalCost(-amount);
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h1>Select Packages and Channels</h1>
    
    <form action="submit.jsp" method="post">
        <div class="package">
            <h3><input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 60)">Movie Channels Package - ₹60/month</h3>
            <div class="channel-list">
                <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="star_maa_movies.jpg" alt="Star Maa Movies">
                    <label>Star Maa Movies</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="zee_cinemalu.jpg" alt="Zee Cinemalu">
                    <label>Zee Cinemalu</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                  <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="MAA Movies">
                    <label>Gemini Movies</label>
                </div>
                  <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                  <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                  <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                  <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                  <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 6)">
                    <img src="gemini_movies.jpg" alt="Gemini Movies">
                    <label>Gemini Movies</label>
                </div>
            </div>
        </div>

        <div class="package">
            <h3><input type="checkbox" name="package" value="sports" onchange="handleCheckboxChange(this, 70)">Sports Channels Package - ₹70/month</h3>
            <div class="channel-list">
                <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="star_sports_telugu.jpg" alt="Star Sports Telugu">
                    <label>Star Sports Telugu</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_ten_1.jpg" alt="Sony Ten 1">
                    <label>Sony Ten 1</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                   <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                   <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                   <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                   <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                   <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                   <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                   <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="sportsPackage" onchange="handleCheckboxChange(this, 9)">
                    <img src="sony_six.jpg" alt="Sony Six">
                    <label>Sony Six</label>
                </div>
                
            </div>
            
        </div>

        <div class="package">
            <h3><input type="checkbox" name="package" value="moviePackage" onchange="handleCheckboxChange(this, 40)"> monthKids Channels Package - ₹45/month</h3>
            <div class="channel-list">
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="chutti_tv.jpg" alt="Chutti TV">
                    <label>Chutti TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="kidsPackage" onchange="handleCheckboxChange(this, 3)">
                    <img src="kushi_tv.jpg" alt="Kushi TV">
                    <label>Kushi TV</label>
                </div>
                
            </div>
        </div>

        <div class="package">
            <h3>News Channels Package - ₹8/month</h3>
            <div class="channel-list">
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="tv9_telugu.jpg" alt="TV9 Telugu">
                    <label>TV9 Telugu</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="ntv.jpg" alt="NTV">
                    <label>NTV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="sakshi_tv.jpg" alt="Sakshi TV">
                    <label>Sakshi TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="abn_andhra_jyothi.jpg" alt="ABN Andhra Jyothi">
                    <label>ABN Andhra Jyothi</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="etv_ap.jpg" alt="ETV Andhra Pradesh">
                    <label>ETV Andhra Pradesh</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="etv_telangana.jpg" alt="ETV Telangana">
                    <label>ETV Telangana</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="v6_news.jpg" alt="V6 News">
                    <label>V6 News</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="tv5_news.jpg" alt="TV5 News">
                    <label>TV5 News</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="t_news.jpg" alt="T News">
                    <label>T News</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="maha_news.jpg" alt="Maha News">
                    <label>Maha News</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="maha_news.jpg" alt="Maha News">
                    <label>Maha News</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="maha_news.jpg" alt="Maha News">
                    <label>Maha News</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="maha_news.jpg" alt="Maha News">
                    <label>Maha News</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="maha_news.jpg" alt="Maha News">
                    <label>Maha News</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="newsPackage" onchange="handleCheckboxChange(this, 8)">
                    <img src="maha_news.jpg" alt="Maha News">
                    <label>Maha News</label>
                </div>
            </div>
        </div>

        <div class="package">
            <h3>Music Channels Package - ₹5/month</h3>
            <div class="channel-list">
                <div class="channel">
                    <input type="checkbox" name="package" value="musicPackage" onchange="handleCheckboxChange(this, 5)">
                    <img src="gemini_music.jpg" alt="Gemini Music">
                    <label>Gemini Music</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="musicPackage" onchange="handleCheckboxChange(this, 5)">
                    <img src="etv_telugu_india.jpg" alt="ETV Telugu India">
                    <label>ETV Telugu India</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="musicPackage" onchange="handleCheckboxChange(this, 5)">
                    <img src="maa_music.jpg" alt="MAA Music">
                    <label>MAA Music</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="musicPackage" onchange="handleCheckboxChange(this, 5)">
                    <img src="maa_music.jpg" alt="MAA Music">
                    <label>MAA Music</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="musicPackage" onchange="handleCheckboxChange(this, 5)">
                    <img src="maa_music.jpg" alt="MAA Music">
                    <label>MAA Music</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="musicPackage" onchange="handleCheckboxChange(this, 5)">
                    <img src="maa_music.jpg" alt="MAA Music">
                    <label>MAA Music</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="musicPackage" onchange="handleCheckboxChange(this, 5)">
                    <img src="maa_music.jpg" alt="MAA Music">
                    <label>MAA Music</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="musicPackage" onchange="handleCheckboxChange(this, 5)">
                    <img src="maa_music.jpg" alt="MAA Music">
                    <label>MAA Music</label>
                </div>
            </div>
        </div>

        <div class="package">
            <h3>General Entertainment Channels Package - ₹10/month</h3>
            <div class="channel-list">
                <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="etv_telugu.jpg" alt="ETV Telugu">
                    <label>ETV Telugu</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="gemini_tv.jpg" alt="Gemini TV">
                    <label>Gemini TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="zee_telugu.jpg" alt="Zee Telugu">
                    <label>Zee Telugu</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="star_maa.jpg" alt="Star Maa">
                    <label>Star Maa</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="star_maa_gold.jpg" alt="Star Maa Gold">
                    <label>Star Maa Gold</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="etv_plus.jpg" alt="ETV Plus">
                    <label>ETV Plus</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="etv_plus.jpg" alt="ETV Plus">
                    <label>ETV Plus</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="etv_plus.jpg" alt="ETV Plus">
                    <label>ETV Plus</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="etv_plus.jpg" alt="ETV Plus">
                    <label>ETV Plus</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="etv_plus.jpg" alt="ETV Plus">
                    <label>ETV Plus</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="etv_plus.jpg" alt="ETV Plus">
                    <label>ETV Plus</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="entertainmentPackage" onchange="handleCheckboxChange(this, 10)">
                    <img src="etv_plus.jpg" alt="ETV Plus">
                    <label>ETV Plus</label>
                </div>
                
            </div>
        </div>

        <div class="package">
            <h3>Spiritual Channels Package - ₹2/month</h3>
            <div class="channel-list">
                <div class="channel">
                    <input type="checkbox" name="package" value="spiritualPackage" onchange="handleCheckboxChange(this, 2)">
                    <img src="bhakti_tv.jpg" alt="Bhakti TV">
                    <label>Bhakti TV</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="spiritualPackage" onchange="handleCheckboxChange(this, 2)">
                    <img src="svbc.jpg" alt="SVBC">
                    <label>SVBC</label>
                </div>
                <div class="channel">
                    <input type="checkbox" name="package" value="spiritualPackage" onchange="handleCheckboxChange(this, 2)">
                    <img src="vedas_tv.jpg" alt="Vedas TV">
                    <label>Vedas TV</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="spiritualPackage" onchange="handleCheckboxChange(this, 2)">
                    <img src="vedas_tv.jpg" alt="Vedas TV">
                    <label>Vedas TV</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="spiritualPackage" onchange="handleCheckboxChange(this, 2)">
                    <img src="vedas_tv.jpg" alt="Vedas TV">
                    <label>Vedas TV</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="spiritualPackage" onchange="handleCheckboxChange(this, 2)">
                    <img src="vedas_tv.jpg" alt="Vedas TV">
                    <label>Vedas TV</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="spiritualPackage" onchange="handleCheckboxChange(this, 2)">
                    <img src="vedas_tv.jpg" alt="Vedas TV">
                    <label>Vedas TV</label>
                </div>
                 <div class="channel">
                    <input type="checkbox" name="package" value="spiritualPackage" onchange="handleCheckboxChange(this, 2)">
                    <img src="vedas_tv.jpg" alt="Vedas TV">
                    <label>Vedas TV</label>
                </div>
            </div>
        </div>
        <div class="package">
         <input type="checkbox" name="package" value="golden" onchange="handleCheckboxChange(this, 250)">
            <h3>cable golden  Package - ₹250/month</h3>
            <div class="channel-list">
                <div class="channel">
                <select>
                <option>List of channels</option>
                    
                  <option>  <img src="tv9_telugu.jpg" alt="TV9 Telugu">
                    <label>TV9 Telugu</label>
                </div>
                <div class="channel"></option>
                    
                   <option> <img src="ntv.jpg" alt="NTV">
                    <label>NTV</label>
                </div></option>
              <option>  <div class="channel">
                   
                    <img src="sakshi_tv.jpg" alt="Sakshi TV">
                    <label>Sakshi TV</label>
                </div></option>
               <option> <div class="channel">
                   
                    <img src="abn_andhra_jyothi.jpg" alt="ABN Andhra Jyothi">
                    <label>ABN Andhra Jyothi</label>
                </div></option>
               <option> <div class="channel">
                    
                    <img src="etv_ap.jpg" alt="ETV Andhra Pradesh">
                    <label>ETV Andhra Pradesh</label>
                </div></option>
             <option>   <div class="channel">
                    
                    <img src="etv_telangana.jpg" alt="ETV Telangana">
                    <label>ETV Telangana</label>
                </div></option>
              <option>  <div class="channel">
                   
                    <img src="v6_news.jpg" alt="V6 News">
                    <label>V6 News</label>
                </div></option>
                <option><div class="channel">
                    
                    <img src="tv5_news.jpg" alt="TV5 News">
                    <label>TV5 News</label>
                </div></option>
                 <option><div class="channel">
                    
                    <img src="bhakti_tv.jpg" alt="Bhakti TV">
                    <label>Bhakti TV</label>
                </div></option>
                <option> <div class="channel">
                   
                    <img src="star_maa_gold.jpg" alt="Star Maa Gold">
                    <label>Star Maa Gold</label>
                </div></option>
              <option>  <div class="channel">
                    
                    <img src="etv_plus.jpg" alt="ETV Plus">
                    <label>ETV Plus</label>
                </div></option>
               <option> <div class="channel">
                    
                    <img src="etv_telugu_india.jpg" alt="ETV Telugu India">
                    <label>ETV Telugu India</label>
                </div></option>
               <option> <div class="channel">
                    
                    <img src="maa_music.jpg" alt="MAA Music">
                    <label>MAA Music</label>
                </div></option>
               
            
        
       <option> 
                <div class="channel">
                    
                    <img src="etv_telugu.jpg" alt="ETV Telugu">
                    <label>ETV Telugu</label>
                </div></option>
               <option> <div class="channel">
                    
                    <img src="gemini_tv.jpg" alt="Gemini TV">
                    <label>Gemini TV</label>
                    </div></option>
                    </select>
<div></div>
        <div class="package">
            <h3>Full Package - ₹350/month</h3>
            <div class="channel-list">
                <div class="channel">
                    <input type="checkbox" name="package" value="fullPackage" onchange="handleCheckboxChange(this, 350)">
                    <label>All Channels</label>
                </div>
            </div>
        </div>
        </div>

        <div class="total-cost" id="totalCost">Total Cost: ₹0</div>
        <button type="submit" class="submit-button">Submit Order</button>
    </form>
</div>

</body>
</html>
