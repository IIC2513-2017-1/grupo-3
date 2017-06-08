class RUTValidator < ActiveModel::Validator

  def validate(record)
    unless RUT.validar(record.id_card_number)
      record.errors[:id_card_number] << I18n.t(:invalid_rut)
    end
  end
end

class BankAccount < ApplicationRecord
  belongs_to :user
  validates :account, presence: true, length: { maximum: 25 }
  validates :id_card_number, presence: true
  validates_with RUTValidator, fields: [:id_card_number]
  validates :bank, presence: true, inclusion: { in: [
    'BANCO DE CHILE - EDWARDS',
    'BANCO BICE',
    'BANCO CONSORCIO',
    'BANCO DEL ESTADO DE CHILE',
    'BANCO DO BRASIL S.A',
    'BANCO FALABELLA',
    'BANCO PARIS',
    'BANCO RIPLEY',
    'BANCO SANTANDER',
    'BBVA (BCO BILBAO VIZCAYA ARG)',
    'BCI (BCO DE CREDITO E INV)',
    'HSBC BANK',
    'ITAU CHILE',
    'ITAU-CORPBANCA',
    'SCOTIABANK'
  ], message: '%{value} is not a valid bank' }
  validates :account_type, presence: true, inclusion: { in: [
    'Cuenta Corriente',
    'Cuenta Vista',
    'Cuenta de Ahorro',
    'Libreta Ahorro'
  ], message: '%{value} is not a valid account type' }
end
