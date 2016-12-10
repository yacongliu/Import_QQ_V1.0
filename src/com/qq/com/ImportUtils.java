package com.qq.com;

import java.awt.print.Book;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

/**
 * 
 * Title: ImportUtils Description: 批量数据导入
 * 
 * @author yacong_liu Email:2682505646@qq.com
 * @date 2016年12月9日
 */
public class ImportUtils {

    /**
     * 
     * <p>
     * Title: readExcel
     * </p>
     * <p>
     * Description: 解析excel
     * </p>
     * 
     * @param excelPath
     * @return List<HashMap<String, Object>>
     */
    public static List<HashMap<String, Object>> readExcel(String excelPath) {
        // 1.导入excel模板文件
        // String excelPath1 = "G:\\tatao-upload\\course\\course-template.xls";
        // 集合存储解析出的数据
        List<HashMap<String, Object>> maps = new ArrayList<HashMap<String, Object>>();
        InputStream is = null;
        Workbook workbook = null;
        Sheet sheet = null;

        try {
            is = new FileInputStream(excelPath);
            // 获取excel对象
            workbook = Workbook.getWorkbook(is);
            // 获取制定的工作表（默认第一个）
            sheet = workbook.getSheet(0);
            // 获取行数
            int rows = sheet.getRows();
            System.out.println(rows);
            // 获取列数
            int columns = sheet.getColumns();

            for (int i = 0; i < columns; i++) {
                Cell[] cells = sheet.getRow(i + 1);
                String title = cells[0].getContents();
                String desc = cells[1].getContents();

                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("title", title);
                map.put("desc", desc);

                maps.add(map);

                System.out.println("title：" + title + " desc: " + desc);
            }

            System.out.println(maps);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (workbook != null) {
                workbook.close();
            }
        }
        return maps;
    }

    public static void main(String[] args) {
        // 1.导入excel模板文件
        String excelFile = "G:\\tatao-upload\\course\\course-template.xls";
        // 集合存储解析出的数据
        List<HashMap<String, Object>> maps = new ArrayList<HashMap<String, Object>>();
        InputStream is = null;
        Workbook workbook = null;
        Sheet sheet = null;

        try {
            is = new FileInputStream(excelFile);
            // 获取excel对象
            workbook = Workbook.getWorkbook(is);
            // 获取制定的工作表（默认第一个）
            sheet = workbook.getSheet(0);
            // 获取行数
            int rows = sheet.getRows();
            System.out.println(rows);
            // 获取列数
            int columns = sheet.getColumns();

            for (int i = 0; i < columns; i++) {
                if (sheet.getRow(i + 1) == null) {
                    continue;
                }

                Cell[] cells = sheet.getRow(i + 1);

                if (cells[0] == null || cells[0].getContents() == null) {
                    break;
                }

                String title = cells[0].getContents();
                String desc = cells[1].getContents();

                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("title", title);
                map.put("desc", desc);

                maps.add(map);

                System.out.println("title：" + title + " desc: " + desc);
            }

            System.out.println(maps);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (workbook != null) {
                workbook.close();
            }
        }
    }
}
