/**
 * 
 */
package br.com.andebem.dto;

/**
 * @author Hans Jakob Emmel
 *
 */
public class GraficoDTO {

	public String label;
	public Long value;

	/**
	 * @return the label
	 */
	public String getLabel() {
		return label;
	}
	/**
	 * @param label the label to set
	 */
	public void setLabel(String label) {
		this.label = label;
	}
	/**
	 * @return the value
	 */
	public Long getValue() {
		return value;
	}
	/**
	 * @param value the value to set
	 */
	public void setValue(Long value) {
		this.value = value;
	}
}