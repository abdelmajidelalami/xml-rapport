<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>rapport</title>
            </head>
            <body>
                <h3>Liste de mandats</h3>
                <table border="1" width="80%" style="border-collapse:collapse">
                    <tr bgcolor="skyblue">
                        <th>Num Mandat</th>
                        <th>Date</th>
                        <th>Expéditeur</th>
                        <th>Destinataire</th>
                        <th>Etat</th>
                        <th>Montant</th>
                    </tr>
                    <xsl:for-each select="/rapport/mandat">
                        <tr>
                            <td><xsl:value-of select="@num"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td>
                                <ul>
                                    <li>CIN:<xsl:value-of select="expediteur/@cin"/></li>
                                    <li>Nom:<xsl:value-of select="expediteur/@nom"/></li>
                                    <li>Prénom:<xsl:value-of select="expediteur/@prenom"/></li>
                                    <li>Ville:<xsl:value-of select="expediteur/@ville"/></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li>CIN:<xsl:value-of select="destinataire/@cin"/></li>
                                    <li>Nom:<xsl:value-of select="destinataire/@nom"/></li>
                                    <li>Prénom:<xsl:value-of select="destinataire/@prenom"/></li>
                                    <li>Ville:<xsl:value-of select="destinataire/@ville"/></li>
                                </ul>
                            </td>
                            <td><xsl:value-of select="@etat"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td colspan="4" rowspan="3" style="border-left:1; border-bottom:1 ; empty-cells:hide"></td>
                        <td>Total des mandats:</td>
                        <td><xsl:value-of select="sum(rapport/mandat/@montant)"/></td>
                    </tr>
                    <tr>
                        <td>Total des mandats reçu:</td>
                        <td><xsl:value-of select="sum(rapport/mandat[@etat='reçu']/@montant)"/></td>
                    </tr>
                    <tr>
                        <td>Total des mandats non reçu:</td>
                        <td><xsl:value-of select="sum(rapport/mandat[@etat='non reçu']/@montant)"/></td>
                    </tr>
                </table>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>