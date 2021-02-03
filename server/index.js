const express = require('express');
const app = express();
const mysql = require('mysql');
const cors = require('cors');

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    user: "root",
    host: "localhost",
    password: "",
    database: "db_rmutl",
  });

  app.get("/showbuilding", (req, res) => {
    db.query("SELECT * FROM tb_building", (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    });
});

app.get("/insertclass/:id", (req, res) => {
  const id = req.params.id;
  db.query("SELECT * FROM tb_building WHERE id = ?",id, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});

app.get("/showclass/:id", (req, res) => {
  const id = req.params.id;
  db.query("SELECT * FROM tb_class c, tb_building d   WHERE d.id = ? AND d.id = c.id_class  ",id, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});




app.delete("/deleteBuilding/:id", (req, res) => {
  const id = req.params.id;
  db.query("DELETE FROM tb_building WHERE id = ?", id, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});

app.delete("/deleteclass/:id_c", (req, res) => {
  const id_c = req.params.id_c;
  db.query("DELETE FROM tb_class WHERE id_c = ?", id_c, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});


app.put("/updatebuilding", (req, res) => {
  const id = req.body.id;
  const name = req.body.name;
  const latitude = req.body.latitude;
  const longitude = req.body.longitude;
  db.query(
    "UPDATE tb_building SET name = ? ,latitude = ?,longitude = ? WHERE id = ?",
    [name,latitude,longitude, id],
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
});



app.put("/updateclass", (req, res) => {
  const id_c  = req.body.id_c ;
  const name_class = req.body.name_class;
  const floor = req.body.floor;
  const phone = req.body.phone;
  const detail	 = req.body.detail;
  db.query(
    "UPDATE tb_class SET name_class = ? ,floor = ?, phone = ?, detail = ? WHERE id_c = ?",
    [name_class,floor,phone, detail ,id_c],
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
});



app.post("/insertdata", (req, res) => {
    const name = req.body.name;
    const latitude = req.body.latitude;
    const longitude = req.body.longitude;
  
    db.query(
      "INSERT INTO tb_building (name, latitude, longitude) VALUES (?,?,?)",
      [name, latitude, longitude],
      (err, result) => {
        if (err) {
          console.log(err);
        } else {
          res.send("Values Inserted");
        }
      }
    );
  });

  app.post("/insertclassroom", (req, res) => {
    const id_class = req.body.id_class;
    const name_class = req.body.name_class;
    const floor = req.body.floor;
    const phone = req.body.phone;
    const detail = req.body.detail;
    
 
    db.query(
      "INSERT INTO tb_class (id_class,name_class, floor, phone, detail) VALUES (?,?,?,?,?)",
      [id_class,name_class, floor, phone, detail],
      (err, result) => {
        if (err) {
          console.log(err);
        } else {
          res.send("Values Inserted");
        }
      }
    );
  });

  app.listen(3001, () => {
    console.log("Yey, your server is running on port 3001");
});