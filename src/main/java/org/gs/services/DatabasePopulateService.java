package org.gs.services;

import org.gs.Database;
import org.gs.props.PropertiesUtil;
import java.nio.file.Files;
import java.nio.file.Path;

public class DatabasePopulateService {
    private static final String POPULATE_DB_KEY = "populate.db.sql";

    public static void main(String[] args) {
        Database database = Database.getInstance();
        new DatabasePopulateService().populateDb(database);
    }

    private void populateDb(Database database) {
        try {
            String populateDbSql = PropertiesUtil.getPropertyValue(POPULATE_DB_KEY);
            String sql = String.join("\n", Files.readAllLines(Path.of(populateDbSql)));
            database.executeUpdate(sql);
        } catch (Exception exception) {
           throw new RuntimeException(exception);
        }
    }
}