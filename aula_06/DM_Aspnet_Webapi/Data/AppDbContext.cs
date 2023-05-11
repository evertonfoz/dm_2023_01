using System;
using DM_Aspnet_Webapi.Model;
using Microsoft.EntityFrameworkCore;

namespace DM_Aspnet_Webapi.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<Funcionario> Funcionarios { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Funcionario>(entity =>
            {
                entity.ToTable("funcionarios");

                // Configuração da chave primária
                entity.HasKey(e => e.FuncionarioID);

                entity.Property(e => e.FuncionarioID)
                    .HasColumnName("funcionarioid")
                    .HasColumnType("integer")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Nome)
                    .HasColumnName("nome")
                    .HasColumnType("text");
            });
        }

    }
}

