package br.com.andebem.entity;

public abstract class AbstractEntity {

	@Override
	public abstract boolean equals(Object obj);

	@Override
	public abstract int hashCode();

	@Override
	public abstract String toString();
}