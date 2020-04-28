/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces.manageInterfaces;

import business.Car;
import business.CarCatalog;
import java.awt.CardLayout;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author Brickea
 */
public class AddPanel extends javax.swing.JPanel {

    /**
     * Creates new form addPanel
     */
    private JPanel viewPanel;
    private CarCatalog carCatalog;

    public AddPanel() {
        initComponents();
    }

    public AddPanel(JPanel viewPanel, CarCatalog carCatalog) {
        initComponents();
        this.viewPanel = viewPanel;
        this.carCatalog = carCatalog;
    }
    private void cleanAllText(){
        this.carCertificationText.setSelectedIndex(0);
        this.carCityText.setSelectedIndex(0);
        this.carManufacturedYearText.setText("");
        this.carManufacturersText.setText("");
        this.carMudleNumberText.setText("");
        this.carPpositionText1Y.setText("");
        this.carPpositionTextX.setText("");
        this.carSeriesNumberText.setText("");
        this.carSetsText.setText("");
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
        seriesNumberLabel = new javax.swing.JLabel();
        carSeriesNumberText = new javax.swing.JTextField();
        seriesNumberText1 = new javax.swing.JLabel();
        carSetsText = new javax.swing.JTextField();
        seriesNumberText2 = new javax.swing.JLabel();
        carManufacturersText = new javax.swing.JTextField();
        seriesNumberText3 = new javax.swing.JLabel();
        carMudleNumberText = new javax.swing.JTextField();
        seriesNumberText4 = new javax.swing.JLabel();
        carManufacturedYearText = new javax.swing.JTextField();
        seriesNumberText5 = new javax.swing.JLabel();
        seriesNumberText6 = new javax.swing.JLabel();
        carPpositionTextX = new javax.swing.JTextField();
        seriesNumberText7 = new javax.swing.JLabel();
        carPpositionText1Y = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        addCarBtn = new javax.swing.JButton();
        carCertificationText = new javax.swing.JComboBox<>();
        carCityText = new javax.swing.JComboBox<>();

        jLabel1.setFont(new java.awt.Font("宋体", 1, 18)); // NOI18N
        jLabel1.setText("Add Car");

        seriesNumberLabel.setText("Series Number");

        seriesNumberText1.setText("Car Sets");

        seriesNumberText2.setText("Manufacturers");

        seriesNumberText3.setText("Model Number");

        seriesNumberText4.setText("Manufactured Year");

        seriesNumberText5.setText("City");

        seriesNumberText6.setText("Pposition");

        seriesNumberText7.setText("Certification");

        jButton1.setText("Back");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        addCarBtn.setText("Add Car");
        addCarBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                addCarBtnActionPerformed(evt);
            }
        });

        carCertificationText.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Not Expired", "Expired" }));

        carCityText.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Boston", "New York" }));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(seriesNumberText7)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(carCertificationText, javax.swing.GroupLayout.PREFERRED_SIZE, 294, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(seriesNumberText6)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(carPpositionTextX, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(44, 44, 44)
                                .addComponent(carPpositionText1Y, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(seriesNumberText5)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(carCityText, javax.swing.GroupLayout.PREFERRED_SIZE, 294, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(seriesNumberText4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(carManufacturedYearText, javax.swing.GroupLayout.PREFERRED_SIZE, 294, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(seriesNumberText3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(carMudleNumberText, javax.swing.GroupLayout.PREFERRED_SIZE, 294, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(seriesNumberText2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(carManufacturersText, javax.swing.GroupLayout.PREFERRED_SIZE, 294, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(seriesNumberText1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(carSetsText, javax.swing.GroupLayout.PREFERRED_SIZE, 294, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(layout.createSequentialGroup()
                                    .addContainerGap()
                                    .addComponent(jLabel1))
                                .addGroup(layout.createSequentialGroup()
                                    .addGap(55, 55, 55)
                                    .addComponent(seriesNumberLabel)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(carSeriesNumberText, javax.swing.GroupLayout.PREFERRED_SIZE, 294, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addComponent(addCarBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 124, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(0, 57, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(seriesNumberLabel)
                    .addComponent(carSeriesNumberText, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(seriesNumberText1)
                    .addComponent(carSetsText, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(seriesNumberText2)
                    .addComponent(carManufacturersText, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(seriesNumberText3)
                    .addComponent(carMudleNumberText, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(seriesNumberText4)
                    .addComponent(carManufacturedYearText, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(carCityText, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(seriesNumberText5))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(seriesNumberText6)
                    .addComponent(carPpositionTextX, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(carPpositionText1Y, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(39, 39, 39)
                        .addComponent(addCarBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 96, Short.MAX_VALUE)
                        .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(carCertificationText, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(seriesNumberText7)))
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        this.viewPanel.remove(this);
        CardLayout layout = (CardLayout) this.viewPanel.getLayout();
        layout.previous(this.viewPanel);
    }//GEN-LAST:event_jButton1ActionPerformed

    private void addCarBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addCarBtnActionPerformed
        // TODO add your handling code here:
        try {
            if (!this.carSeriesNumberText.getText().equals("")) {
                Car car = new Car();
                car.setCarSeriesNumber(Integer.parseInt(this.carSeriesNumberText.getText()));
                
                if(((String)this.carCertificationText.getSelectedItem()).equals("Expired")){
                    car.setCarCertification(false);
                }else{
                    car.setCarCertification(true);
                }
                
                car.setCarCity((String)this.carCityText.getSelectedItem());
                car.setCarManufacturedYear(Integer.parseInt(this.carManufacturedYearText.getText()));
                car.setCarManufacturers(this.carManufacturersText.getText());
                car.setCarModelNumber(this.carMudleNumberText.getText());
                car.setCarPposition(Integer.parseInt(this.carPpositionTextX.getText()), Integer.parseInt(this.carPpositionText1Y.getText()));
                car.setCarSets(Integer.parseInt(this.carSetsText.getText()));
                
                if (!this.carCatalog.isExistCar(car)) {
                    this.carCatalog.addCar(car);
                    JOptionPane.showMessageDialog(null, "Successfully add a car record");
                    this.cleanAllText();
                } else {
                    JOptionPane.showMessageDialog(null, "The series number is exist!");
                }
            }else{
                JOptionPane.showMessageDialog(null, "The series number is empty!");
            }
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Please input a valid number!");
        }

    }//GEN-LAST:event_addCarBtnActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton addCarBtn;
    private javax.swing.JComboBox<String> carCertificationText;
    private javax.swing.JComboBox<String> carCityText;
    private javax.swing.JTextField carManufacturedYearText;
    private javax.swing.JTextField carManufacturersText;
    private javax.swing.JTextField carMudleNumberText;
    private javax.swing.JTextField carPpositionText1Y;
    private javax.swing.JTextField carPpositionTextX;
    private javax.swing.JTextField carSeriesNumberText;
    private javax.swing.JTextField carSetsText;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel seriesNumberLabel;
    private javax.swing.JLabel seriesNumberText1;
    private javax.swing.JLabel seriesNumberText2;
    private javax.swing.JLabel seriesNumberText3;
    private javax.swing.JLabel seriesNumberText4;
    private javax.swing.JLabel seriesNumberText5;
    private javax.swing.JLabel seriesNumberText6;
    private javax.swing.JLabel seriesNumberText7;
    // End of variables declaration//GEN-END:variables
}
