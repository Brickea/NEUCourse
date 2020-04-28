/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces.orderInterfaces;

import business.Car;
import business.CarCatalog;
import java.awt.CardLayout;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Brickea
 */
public class OrderCarsFound extends javax.swing.JPanel {

    /**
     * Creates new form OrderCarsFound
     */
    private JPanel viewPanel;
    private CarCatalog carCatalog;
    private CarCatalog tempCatalog;
    private CarCatalog customerCatalog = null;

    public OrderCarsFound() {
        initComponents();
    }

    public OrderCarsFound(JPanel viewPanel, CarCatalog carCatalog, CarCatalog tempCatalog) {
        initComponents();
        this.viewPanel = viewPanel;
        this.carCatalog = carCatalog;
        this.tempCatalog = tempCatalog;
        this.populate(this.tempCatalog);

    }

    private void customerSearch() {

        customerCatalog = new CarCatalog();

        boolean search = false;

        boolean firstCondition = true;

        String year = this.yearText.getText();
        String maxSets = this.maxSetLabel.getText();
        String minSets = this.minSetLabel.getText();

        String manuFacturer = this.manuFacturerText.getText();
        String model = this.modelText.getText();

        if (!manuFacturer.equals("")) {
            search = true;
            CarCatalog searchCatalog = new CarCatalog();

            if (this.customerCatalog.getCarCatalog().isEmpty() && firstCondition) {
                searchCatalog = this.tempCatalog;
            } else {
                searchCatalog = this.customerCatalog;
                this.customerCatalog = new CarCatalog();
            }

            for (Car c : searchCatalog.getCarCatalog()) {
                if (c.getCarManufacturers().equals(manuFacturer)) {
                    this.customerCatalog.addCar(c);
                }
            }

            firstCondition = false;
        }

        if (!model.equals("")) {
            search = true;
            CarCatalog searchCatalog = new CarCatalog();

            if (this.customerCatalog.getCarCatalog().isEmpty() && firstCondition) {
                searchCatalog = this.tempCatalog;
            } else {
                searchCatalog = this.customerCatalog;
                this.customerCatalog = new CarCatalog();
            }

            for (Car c : searchCatalog.getCarCatalog()) {
                JOptionPane.showMessageDialog(null,model);
                if (c.getCarModelNumber().equals(model)) {
                    this.customerCatalog.addCar(c);
                }
            }

            firstCondition = false;
        }

        if (!year.equals("")) {
            search = true;
            CarCatalog searchCatalog = new CarCatalog();

            if (this.customerCatalog.getCarCatalog().isEmpty() && firstCondition) {
                searchCatalog = this.tempCatalog;
            } else {
                searchCatalog = this.customerCatalog;
                this.customerCatalog = new CarCatalog();
            }

            int yearNumber = 0;
            try {
                yearNumber = Integer.parseInt(year);
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(null, "Please input a valid number!");
            }

            for (Car c : searchCatalog.getCarCatalog()) {
                if (c.getCarManufacturedYear() == yearNumber) {
                    this.customerCatalog.addCar(c);
                }
            }

            firstCondition = false;
        }
        if (!maxSets.equals("") && !minSets.equals("")) {
            search = true;
            CarCatalog searchCatalog = new CarCatalog();

            if (this.customerCatalog.getCarCatalog().isEmpty() && firstCondition) {
                searchCatalog = this.tempCatalog;
            } else {
                searchCatalog = this.customerCatalog;
                this.customerCatalog = new CarCatalog();
            }

            int maxSetsNumber = 0;
            int minSetsNumber = 0;
            try {
                maxSetsNumber = Integer.parseInt(maxSets);
                minSetsNumber = Integer.parseInt(minSets);
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(null, "Please input a valid number!");
            }
            for (Car c : searchCatalog.getCarCatalog()) {
                if (c.getCarSets() >= minSetsNumber && c.getCarSets() <= maxSetsNumber) {
                    this.customerCatalog.addCar(c);
                }
            }

            firstCondition = false;
        }
        if (search) {
            this.populate(this.customerCatalog);
        }

    }

    private void populate(CarCatalog log) {

        this.availableLabel.setText("Available:" + String.valueOf(log.getCarCatalog().size()));
        this.unavailableLabel.setText("Unavailable:" + String.valueOf(this.carCatalog.getCarCatalog().size() - log.getCarCatalog().size()));
        DefaultTableModel dtm = (DefaultTableModel) this.jTable1.getModel();
        dtm.setRowCount(0);

        for (Car c : log.getCarCatalog()) {
            Object[] row = new Object[dtm.getColumnCount()];
            row[0] = c;
            row[1] = c.getCarManufacturers();
            row[2] = c.getCarManufacturedYear();
            row[3] = c.getCarSets();
            row[4] = c.getCarModelNumber();
            dtm.addRow(row);
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        backBtn = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        availableLabel = new javax.swing.JLabel();
        unavailableLabel = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        manuFacturerText = new javax.swing.JTextField();
        yearText = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        modelText = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        maxSetLabel = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        minSetLabel = new javax.swing.JTextField();
        searchBtn = new javax.swing.JButton();
        cleanSearchBtn = new javax.swing.JButton();

        jLabel1.setFont(new java.awt.Font("宋体", 1, 18)); // NOI18N
        jLabel1.setText("Order Cars Found");

        backBtn.setText("Back");
        backBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                backBtnActionPerformed(evt);
            }
        });

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Series Number", "Manufacturers", "Year", "Sets", "Model"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Object.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);
        if (jTable1.getColumnModel().getColumnCount() > 0) {
            jTable1.getColumnModel().getColumn(0).setResizable(false);
            jTable1.getColumnModel().getColumn(1).setResizable(false);
            jTable1.getColumnModel().getColumn(2).setResizable(false);
            jTable1.getColumnModel().getColumn(3).setResizable(false);
            jTable1.getColumnModel().getColumn(4).setResizable(false);
        }

        availableLabel.setText("Available:");

        unavailableLabel.setText("Unavailable:");

        jLabel4.setText("Manufacturer:");

        jLabel5.setText("Year:");

        jLabel6.setText("Model:");

        jLabel7.setText("Max sets");

        maxSetLabel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                maxSetLabelActionPerformed(evt);
            }
        });

        jLabel8.setText("Min sets");

        searchBtn.setText("Search");
        searchBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchBtnActionPerformed(evt);
            }
        });

        cleanSearchBtn.setText("Clean Search");
        cleanSearchBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cleanSearchBtnActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 478, Short.MAX_VALUE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(backBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(cleanSearchBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 107, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(31, 31, 31)
                                .addComponent(searchBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 105, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(29, 29, 29)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(manuFacturerText))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(availableLabel)
                                .addGap(128, 128, 128)
                                .addComponent(unavailableLabel)
                                .addGap(171, 171, 171))
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel5)
                                    .addComponent(jLabel6)
                                    .addComponent(jLabel7))
                                .addGap(34, 34, 34)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(maxSetLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 122, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addComponent(jLabel8)
                                        .addGap(29, 29, 29)
                                        .addComponent(minSetLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addComponent(modelText)
                                    .addComponent(yearText, javax.swing.GroupLayout.Alignment.LEADING))))))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 166, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(availableLabel)
                    .addComponent(unavailableLabel))
                .addGap(29, 29, 29)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(manuFacturerText, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(yearText, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(modelText, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(22, 22, 22)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(jLabel8)
                    .addComponent(minSetLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(maxSetLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 44, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(backBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(cleanSearchBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(searchBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    private void backBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_backBtnActionPerformed
        // TODO add your handling code here:
        this.viewPanel.remove(this);
        CardLayout layout = (CardLayout) this.viewPanel.getLayout();
        layout.previous(this.viewPanel);
    }//GEN-LAST:event_backBtnActionPerformed

    private void maxSetLabelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_maxSetLabelActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_maxSetLabelActionPerformed

    private void cleanSearchBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cleanSearchBtnActionPerformed
        // TODO add your handling code here:
        this.manuFacturerText.setText("");
        this.yearText.setText("");
        this.minSetLabel.setText("");
        this.maxSetLabel.setText("");
        this.modelText.setText("");

        this.customerCatalog = null;
        this.populate(this.tempCatalog);
    }//GEN-LAST:event_cleanSearchBtnActionPerformed

    private void searchBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchBtnActionPerformed
        // TODO add your handling code here:
        this.customerSearch();
    }//GEN-LAST:event_searchBtnActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel availableLabel;
    private javax.swing.JButton backBtn;
    private javax.swing.JButton cleanSearchBtn;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField manuFacturerText;
    private javax.swing.JTextField maxSetLabel;
    private javax.swing.JTextField minSetLabel;
    private javax.swing.JTextField modelText;
    private javax.swing.JButton searchBtn;
    private javax.swing.JLabel unavailableLabel;
    private javax.swing.JTextField yearText;
    // End of variables declaration//GEN-END:variables
}
