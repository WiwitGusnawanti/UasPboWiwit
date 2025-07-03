<%@ page import="java.util.*, com.app.wiwit.model.Hero" %>
<%
    List<Hero> list = (List<Hero>) request.getAttribute("listHero");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Daftar Hero</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background:  #dbfa4b;
            color: #f4f4f4;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 16px rgb(255, 255, 255);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            color: #dbfa4b;
        }

        .add-btn {
            display: block;
            width: fit-content;
            padding: 12px 20px;
            background-color: #dbfa4b;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }

        .add-btn:hover {
            background-color: #dbfa4b;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #000000;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #000000;
        }

        th {
            background-color: #000000;
            color: #dbfa4b;
            font-weight: 600;
        }

        tr:hover {
            background-color: #000000;
        }

        .action-link {
            color: #dbfa4b;
            text-decoration: none;
            margin: 0 6px;
            font-weight: 500;
        }

        .action-link:hover {
            text-decoration: underline;
            color: #dbfa4b;
        }

        .no-data {
            text-align: center;
            color: #000000;
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Daftar Hero Mobile Legend</h2>
    <a href="form.jsp" class="add-btn">+ Tambah Hero</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Nama</th>
            <th>Kategori</th>
            <th>Gender</th>
            <th>Aksi</th>
        </tr>
        <%
            if (list != null && !list.isEmpty()) {
                for (Hero h : list) {
        %>
        <tr>
            <td><%= h.getIdHero() %></td>
            <td><%= h.getNamaHero() %></td>
            <td><%= h.getKategori() %></td>
            <td><%= h.getGender() %></td>
            <td>
                <a class="action-link" href="HeroServlet?action=edit&id=<%= h.getIdHero() %>">Edit</a>
                <a class="action-link" href="HeroServlet?action=delete&id=<%= h.getIdHero() %>"
                   onclick="return confirm('Yakin ingin hapus?')">Hapus</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" class="no-data">Data tidak tersedia</td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>