import java.awt.BorderLayout;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 * Items
 */
class Items {

    private String nama, harga;

    public Items(String nama, String harga) {
        this.nama = nama;
        this.harga = harga;
    }

    public String getNama() {
        return this.nama;
    }

    public String getHarga() {
        return this.harga;
    }
    
}

/**
 * Main
 */
class Main extends JFrame{

    public Main() {
        super("Belajar Database");
        setLocationRelativeTo(null);
        setSize(600,400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }

    static Connection getConnection(){
        Connection con = null;
        
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/cafe", "root", "");
        } catch (SQLException ex) {
        }
        return con;
    }

    static ArrayList<Items> getUsers(){
        
        ArrayList<Items> users = new ArrayList<Items>();
        Connection con = getConnection();
        Statement st;
        ResultSet rs;
        Items u;
        
        try {
            
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM items");
            
            while(rs.next()){
                u = new Items(
                    rs.getString("nama"),
                    rs.getString("harga")
                );
                
                users.add(u);
            }
        } catch (SQLException ex) {
        }

        return users;
    }

    public static void main(String[] args) {
        JTable table = new JTable();
        DefaultTableModel model = new DefaultTableModel();
        Object[] columnsName = new Object[2];
        
        columnsName[0] = "nama";
        columnsName[1] = "harga";
        
        model.setColumnIdentifiers(columnsName);
        
        Object[] rowData = new Object[2];
        
        for(int i = 0; i < getUsers().size(); i++){
            
            rowData[0] = getUsers().get(i).getNama();
            rowData[1] = getUsers().get(i).getHarga();
            model.addRow(rowData);
        }
        
        table.setModel(model);
        Main window = new Main();
        JPanel panel = new JPanel();
        panel.setLayout(new BorderLayout());
        JScrollPane pane = new JScrollPane(table);
        panel.add(pane,BorderLayout.CENTER);
        window.setContentPane(panel);
    }

}