<%@ page import="com.app.wiwit.model.Hero" %>
<%
  Hero hero = (Hero) request.getAttribute("hero");
  if (hero == null) {
    hero = new Hero();
    hero.setIdHero(0); // default untuk tambah data
  }
%>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>WIWIT GUSNAWANTI</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background: #dbfa4b;
      color: #000000;
    }

    .container {
      max-width: 500px;
      margin: 60px auto;
      padding: 30px;
      background-color: #ffffff;
      border-radius: 10px;
      box-shadow: 0 4px 16px rgba(0,0,0,0.6);
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
      font-weight: 600;
      color: #000000;
    }

    label {
      font-weight: 500;
      margin-bottom: 8px;
      display: block;
    }

    input[type=text],
    select {
      width: 100%;
      padding: 12px 16px;
      margin-bottom: 20px;
      border: none;
      border-radius: 6px;
      background-color: #ffffff;
      color: #000000;
      font-size: 15px;
    }

    input[type=submit] {
      width: 100%;
      background-color: #dbfa4b;
      color: #000000;
      border: none;
      padding: 14px;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    input[type=submit]:hover {
      background-color: #dbfa4b;
    }

    a {
      display: block;
      text-align: center;
      margin-top: 15px;
      text-decoration: none;
      color: #dbfa4b;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="container">
  <h2><%= (hero.getIdHero() == 0) ? "Tambah Hero" : "Edit Hero" %></h2>
  <form action="HeroServlet" method="post">
    <input type="hidden" name="id_hero" value="<%= hero.getIdHero() %>" />

    <label for="nama">Nama Hero:</label>
    <input type="text" id="nama" name="nama_hero" value="<%= hero.getNamaHero() %>" required />

    <label for="kategori">Kategori:</label>
    <select id="kategori" name="kategori" required>
      <option value="">-- Pilih Kategori --</option>
      <option value="MAGE" <%= "MAGE".equals(hero.getKategori()) ? "selected" : "" %>>MAGE</option>
      <option value="ASSASIN" <%= "ASSASIN".equals(hero.getKategori()) ? "selected" : "" %>>ASSASIN</option>
      <option value="FIGHTER" <%= "FIGHTER".equals(hero.getKategori()) ? "selected" : "" %>>FIGHTER</option>
      <option value="TANK" <%= "TANK".equals(hero.getKategori()) ? "selected" : "" %>>TANK</option>
      <option value="MARKSMAN" <%= "MARKSMAN".equals(hero.getKategori()) ? "selected" : "" %>>MARKSMAN</option>
      <option value="SUPPORT" <%= "SUPPORT".equals(hero.getKategori()) ? "selected" : "" %>>SUPPORT</option>
    </select>

    <label for="gender">Gender:</label>
    <select id="gender" name="gender" required>
      <option value="">-- Pilih Gender --</option>
      <option value="MALE" <%= "MALE".equals(hero.getGender()) ? "selected" : "" %>>MALE</option>
      <option value="FEMALE" <%= "FEMALE".equals(hero.getGender()) ? "selected" : "" %>>FEMALE</option>
    </select>

    <input type="submit" value="Simpan">
    <a href="HeroServlet">Kembali ke daftar</a>
  </form>
</div>
</body>
</html>