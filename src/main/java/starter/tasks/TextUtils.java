package starter.tasks;

public class TextUtils {
    /**
     * A method to format the input text by capitalizing the first letter of each word.
     *
     * @param  texto the text to be formatted
     * @return       the formatted text
     */
    public static String formatText(String texto) {
        texto = texto.trim();
        String[] palabras = texto.split(" ");
        StringBuilder resultado = new StringBuilder();
        for (String palabra : palabras) {
            if (palabra.length() > 0) {
                char primeraLetra = Character.toUpperCase(palabra.charAt(0));
                resultado.append(primeraLetra).append(palabra.substring(1));
            }
        }
        return resultado.toString().trim();
    }
}
